import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:simple_money_tracker/src/core/core.dart';

part 'enter_amount_state.freezed.dart';

@freezed
class EnterAmountEvent with _$EnterAmountEvent {
  const factory EnterAmountEvent.backspacePress() = _BackspacePress;

  const factory EnterAmountEvent.clearPress() = _ClearPress;

  const factory EnterAmountEvent.dotPress() = _DotPress;

  const factory EnterAmountEvent.equalPress() = _EqualPress;

  const factory EnterAmountEvent.numberPress(int number) = _NumberPress;

  const factory EnterAmountEvent.operatorPress(CalculatorItem calOperator) =
      _OperatorPress;

  const factory EnterAmountEvent.threeZeroPress() = _ThreeZeroPress;
}

@freezed
class EnterAmountState with _$EnterAmountState {
  factory EnterAmountState({
    /// Calculate items for perfom calculate. eg 2+20-5*5
    /// When click = this will use to calculate value
    required IList<CalculatorItem> calItems,

    /// If value to calculate is incorrect
    required bool incorrecFormat,

    /// Value error message
    required Option<String> valueErrorMgs,
  }) = _EnterAmountState;

  const EnterAmountState._();

  factory EnterAmountState.initial() {
    return EnterAmountState(
      incorrecFormat: false,
      valueErrorMgs: none(),
      calItems: <CalculatorItem>[const CalculatorItem.number("0")].lock,
    );
  }

  bool get showEqualButton => calItems.length > 1;
  num? get result => calItems.last.whenOrNull(number: (value) => num.parse(value));

  String get displayText => calItems
      .map(
        (e) => e.when(
          add: () => "+",
          divide: () => "/",
          multiply: () => "*",
          number: (n) {
            /// it throw exeption if string contain only "-"
            /// Because we need to format it below
            if (n == "-") return n;

            final a = NumberFormat.decimalPattern();
            final s = a.format(double.parse(n));
            // fix . at the end not show
            if (n.getLastChar() == ".") {
              return "$s.";
            }

            // If last digit is zero after decimal point, show it too
            // Make sure there 3 char3
            if (n.length >= 3 && n.contains(".")) {
              final decimal = n.split(".").last;
              if (decimal == "0") {
                return "$s.0";
              } else if (decimal == "00") {
                return "$s.00";
              } else if (decimal.length == 2 && decimal.getLastChar() == "0") {
                return "${s}0";
              }
            }

            return s;
          },
          substract: () => "-",
        ),
      )
      .join();
}

@freezed
class CalculatorItem with _$CalculatorItem {
  const factory CalculatorItem.add() = _Add;

  const factory CalculatorItem.divide() = _Divide;

  const factory CalculatorItem.multiply() = _Multiply;

  const factory CalculatorItem.number(String value) = _Number;

  const factory CalculatorItem.substract() = _Substract;
}
