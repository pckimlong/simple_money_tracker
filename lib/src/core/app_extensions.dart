import 'package:simple_money_tracker/src/core/core.dart';

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
