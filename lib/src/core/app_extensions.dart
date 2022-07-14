import 'package:currency_picker/currency_picker.dart';
import 'package:intl/intl.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:money2/money2.dart' as m;

import '../../exports.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  bool get isDarkTheme => theme.isDarkMode;
}

extension ResponsiveX on BuildContext {
  ResponsiveWrapperData get responsive => ResponsiveWrapper.of(this);
  bool get isMobileSize => responsive.isMobile || responsive.isSmallerThan(MOBILE);
  bool get isTableSize =>
      (responsive.isLargerThan(MOBILE) && responsive.isSmallerThan(DESKTOP)) ||
      responsive.isTablet;
  bool get isDesktopSize => responsive.isLargerThan(TABLET) || responsive.isDesktop;
}

extension ThemeDataX on ThemeData {
  bool get isDarkMode => brightness == Brightness.dark;
  Color? get unFocusTextColor => textTheme.caption?.color;
  Color? get lightHintColor => hintColor.withOpacity(0.5);
  TextStyle? get errorTextStyle =>
      textTheme.overline?.copyWith(color: colorScheme.error);
  List<BoxShadow> get taskCardShadow => [
        BoxShadow(
          color: iconTheme.color!.withOpacity(0.2),
          blurRadius: 2,
          offset: const Offset(1, 2),
        ),
        BoxShadow(
          color: colorScheme.secondary.withOpacity(0.08),
          blurRadius: 50,
          spreadRadius: -12,
          offset: const Offset(2, 18),
        ),
      ];
}

extension OptionX<T> on Option<T> {
  T getOrCrash() => getOrElse(() => throw OptionIsNoneError());
}

extension AsynceOption<T> on AsyncValue<Option<T>> {
  T? nullable() => valueOrNull?.toNullable();
}

extension CurrencyDouble on double {
  String formatCurrency([Currency? currency]) {
    if (currency == null) {
      return NumberFormat.currency(customPattern: "#,###.00").format(this);
    }

    String pattern = "#${currency.thousandsSeparator}###";
    pattern += currency.decimalSeparator;
    pattern += "0" * currency.decimalDigits;
    if (currency.symbolOnLeft) {
      pattern = "S$pattern";
    } else {
      pattern = "${pattern}S";
    }

    final money = m.Money.fromNumWithCurrency(
      this,
      m.Currency.create(
        currency.code,
        currency.decimalDigits,
        pattern: pattern,
        name: currency.name,
        symbol: currency.symbol,
      ),
    );
    return money.toString();
  }
}

extension StringX on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String removeLast() {
    if (trim().isEmpty) return this;
    List<String> chars = split("");
    chars.removeLast();
    return chars.join();
  }

  String getLastChar() {
    if (trim().isEmpty) return this;
    return this[length - 1];
  }

  String removeDecimalFromStringIfZero() {
    if (contains(".")) {
      final result = num.tryParse(this);
      if (result == null) {
        return this;
      }

      final decimal = split(".").last;
      final decimalValue = num.parse(decimal);
      if (decimalValue == 0) {
        return split(".").first;
      }
    }
    return this;
  }
}
