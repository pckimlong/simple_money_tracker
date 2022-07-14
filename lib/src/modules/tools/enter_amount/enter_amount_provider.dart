import 'package:simple_money_tracker/src/core/core.dart';

import '../../../../exports.dart';
import 'enter_amount_state.dart';

final enterAmountProvider =
    StateNotifierProvider.autoDispose<_EnterAmountNotifier, EnterAmountState>(
  (_) => _EnterAmountNotifier(),
);

class _EnterAmountNotifier extends StateNotifier<EnterAmountState> {
  _EnterAmountNotifier() : super(EnterAmountState.initial());

  void bindInitialValue(num initialValue) {
    if (mounted) {
      final formatedValue =
          initialValue.toStringAsFixed(2).removeDecimalFromStringIfZero();
      _changeCalItemState(<CalculatorItem>[CalculatorItem.number(formatedValue)].lock);
    }
  }

  void mapStateToEvent(EnterAmountEvent event) {
    event.when(
      numberPress: _addNumber,
      equalPress: _performCalculation,
      operatorPress: _operatorPress,
      clearPress: () => _changeCalItemState([const CalculatorItem.number("0")].lock),
      dotPress: _onDotPress,
      backspacePress: _backspacePress,
      threeZeroPress: _threeZeroPress,
    );
  }

  /// If list is in invalid state, restore it to normal, this should call
  /// when calItems list state changed
  void clearValueError() {
    state = state.copyWith(incorrecFormat: false, valueErrorMgs: none());
  }

  void _addCalItemToTheLastAndUpdateState(CalculatorItem item) {
    final addedList = _calItems.add(item);
    _changeCalItemState(addedList);
  }

  void _addNumber(int number) {
    _lastItem.maybeWhen(
      number: (init) {
        /// Maximium lenth of number
        if (_reachedMaxLength(init)) {
          return;
        }

        /// Allow only 2 decimal
        if (init.contains('.') && init.indexOf('.') == init.length - 3) {
          return;
        }

        /// If the last char is dot, no need to do anything just add another
        /// number behind it
        if (init.getLastChar() == "." || init.getLastChar() == "-") {
          _updateLastCalItemAndUpdateState(CalculatorItem.number("$init$number"));
          return;
        }

        /// If First char is zero replace it with number
        final initial = double.parse(init);
        if (initial == 0 && !init.contains(".")) {
          _updateLastCalItemAndUpdateState(CalculatorItem.number(number.toString()));
          return;
        }

        /// Other wise just add to the end of it
        final newValue = CalculatorItem.number("$init$number");
        _updateLastCalItemAndUpdateState(newValue);
      },
      orElse: () {
        state = state.copyWith(
          calItems: state.calItems.add(
            CalculatorItem.number(number.toString()),
          ),
        );
      },
    );
  }

  void _backspacePress() {
    _lastItem.maybeWhen(
      number: (value) {
        String newValue = value.removeLast();

        /// When clear number to empty
        if (newValue.isEmpty) {
          /// Check if list has only one item or not
          if (_calItems.length == 1) {
            /// If one item left, just make it zero
            newValue = "0";
          } else {
            /// Otherwise remove the last item
            final updated = _calItems.removeLast();
            _changeCalItemState(updated);
            return;
          }
        }
        _updateLastCalItemAndUpdateState(CalculatorItem.number(newValue));
      },
      orElse: () {
        final updated = _calItems.removeLast();
        _changeCalItemState(updated);
      },
    );
  }

  IList<CalculatorItem> get _calItems => state.calItems;

  void _calculate() {
    /// Mutable list which can reduce
    List<CalculatorItem> calcs = _calItems.unlock;

    /// Temperory store number
    num result = 0;

    // Perform calculate on "*" or "/" first
    while (calcs.contains(const CalculatorItem.divide()) ||
        calcs.contains(const CalculatorItem.multiply())) {
      // Find operator position
      final pos = calcs.indexWhere(
        (e) => e.maybeWhen(
          divide: () => true,
          multiply: () => true,
          orElse: () => false,
        ),
      );
      _reduceCalItems(calcs, pos, result);
    }

    //After clear "/" and "*". Peform simple calculation on "+" or "-"
    while (calcs.length > 1) {
      final pos = calcs.indexWhere(
        (e) => e.maybeWhen(
          add: () => true,
          substract: () => true,
          orElse: () => false,
        ),
      );
      _reduceCalItems(calcs, pos, result);
    }

    _changeCalItemState(<CalculatorItem>[calcs[0]].lock);
  }

  void _changeCalItemState(IList<CalculatorItem> items) {
    state = state.copyWith(calItems: items);
  }

  CalculatorItem get _lastItem => state.calItems.last;

  void _onDotPress() {
    _lastItem.maybeWhen(
      number: (value) {
        /// Don't add if already existed
        if (value.contains(".")) {
          return;
        }

        final newValue = "$value.";
        _updateLastCalItemAndUpdateState(CalculatorItem.number(newValue));
      },
      orElse: () {
        _addCalItemToTheLastAndUpdateState(const CalculatorItem.number("0."));
      },
    );
  }

  void _operatorPress(CalculatorItem calOperator) {
    _lastItem.maybeWhen(
      number: (value) {
        /// If there - sign don't add it again, this lead to error
        /// when parse to double
        if (value.getLastChar() == "-") {
          return;
        }

        final number = double.parse(value);

        /// If the number is zero we cannot use any operator, except it is a
        /// subtraction we can insert
        if (number == 0) {
          calOperator.whenOrNull(
            substract: () =>
                _updateLastCalItemAndUpdateState(const CalculatorItem.number("-")),
          );
          return;
        }

        /// Other from zero, just add normally
        _addCalItemToTheLastAndUpdateState(calOperator);
      },
      orElse: () => _updateLastCalItemAndUpdateState(calOperator),
    );
  }

  void _performCalculation() {
    /// If last item is not number, mean list is not complete, so alert to
    /// user that list cannot be calculate
    _lastItem.maybeWhen(
      number: (_) => _calculate(),
      orElse: () => _raiseIncorrectFormatError(),
    );
  }

  void _raiseIncorrectFormatError() {
    state = state.copyWith(incorrecFormat: false);
    state = state.copyWith(incorrecFormat: true);
  }

  bool _reachedMaxLength(String string) {
    if (string.length >= 13) {
      state = state.copyWith(valueErrorMgs: some('Maximum characters'));
      return true;
    }
    return false;
  }

  void _reduceCalItems(List<CalculatorItem> calcs, int pos, num result) {
    final leftOp = calcs[pos - 1].whenOrNull(number: id)!;
    final rightOp = calcs[pos + 1].whenOrNull(number: id)!;

    calcs[pos].whenOrNull(
      add: () => result = num.parse(leftOp) + num.parse(rightOp),
      substract: () => result = num.parse(leftOp) - num.parse(rightOp),
      divide: () {
        final result = num.parse(leftOp) / num.parse(rightOp);
        if (!result.isFinite) {
          _raiseIncorrectFormatError();
          return null;
        }
      },
      multiply: () => result = num.parse(leftOp) * num.parse(rightOp),
    );
    calcs.removeAt(pos);
    calcs.removeAt(pos);
    final resultString = result.toStringAsFixed(2).removeDecimalFromStringIfZero();
    calcs[pos - 1] = CalculatorItem.number(resultString);
  }

  void _threeZeroPress() {
    _lastItem.maybeWhen(
      number: (value) {
        if (_reachedMaxLength(value)) {
          return;
        }

        final v = num.parse(value);
        if (v == 0) {
          return;
        }

        if (value.contains(".")) {
          var newValue = value;
          if (value.getLastChar() == ".") {
            newValue = "${newValue}00";
          } else if (newValue.split(".").last.length == 1) {
            newValue = "${newValue}0";
          }
          _updateLastCalItemAndUpdateState(CalculatorItem.number(newValue));
        } else {
          var newValue = "${value}000";
          final newLength = newValue.length;
          if (newLength > 13) {
            final greaterLength = 13 - value.length;
            newValue = value + "0" * greaterLength;
          }
          _updateLastCalItemAndUpdateState(CalculatorItem.number(newValue));
        }
      },
      orElse: () {
        _addCalItemToTheLastAndUpdateState(const CalculatorItem.number("0"));
      },
    );
  }

  void _updateLastCalItemAndUpdateState(CalculatorItem updated) {
    final removedList = _calItems.removeLast();
    final updatedList = removedList.add(updated);
    _changeCalItemState(updatedList);
  }
}
