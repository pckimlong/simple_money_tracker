import 'package:simple_money_tracker/src/core/app_extensions.dart';

import '../../../exports.dart';

class AS {
  const AS._();

  static Color? appBarBackgroundColor(BuildContext context) {
    return context.theme.scaffoldBackgroundColor;
  }

  static InputDecoration outlinedInputDecoration(
    BuildContext context, {
    Widget? suffixIcon,
  }) {
    final outlinedBorder = OutlineInputBorder(
      borderRadius: AS.roundedBorderRadius,
      borderSide: BorderSide(color: context.colors.primary),
    );

    return InputDecoration(
      hintText: 'Search by model...',
      constraints: const BoxConstraints(
        minHeight: AS.buttonHeight - 8,
        maxHeight: AS.buttonHeight - 8,
      ),
      contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
      border: outlinedBorder,
      enabledBorder: outlinedBorder,
      focusedBorder: outlinedBorder,
      disabledBorder: outlinedBorder,
      filled: false,
      isDense: true,
      suffixIcon: suffixIcon,
    );
  }

  static const primaryColor = Color(0xFF3F51B5);
  static const bgColor = Color(0xFFF0F2F5);
  static const secondColor = Colors.deepOrangeAccent;
  static const becarefulColor = Color(0xFFF56331);
  static const geenColor = Color(0xFF1FA054);
  static const hintColor = Colors.black45;
  static final fieldColor = Colors.blueGrey[50];
  static const iconColor = Colors.blueGrey;

  static const sidePadding = 16.0;

  static const radiusValue = 12.0;
  static const radius = Radius.circular(radiusValue);
  static const titleTextStyle = TextStyle(
    color: primaryColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const BoxShadow defaultShadow = BoxShadow(
    blurRadius: 15,
    color: Colors.black26,
    spreadRadius: -5,
  );

  static const BoxDecoration shadowedContainerDecoration = BoxDecoration(
    borderRadius: roundedBorderRadius,
    boxShadow: [defaultShadow],
  );

  static const double buttonHeight = 45;
  static const double bottomSheetHeaderHeight = 50.0;
  static const roundedBorderRadius = BorderRadius.all(Radius.circular(radiusValue));

  static const wGap12 = SizedBox(width: 12, height: 0);
  static const wGap16 = SizedBox(width: 16, height: 0);
  static const wGap20 = SizedBox(width: 20, height: 0);
  static const wGap24 = SizedBox(width: 24, height: 0);
  static const wGap28 = SizedBox(width: 28, height: 0);
  static const wGap32 = SizedBox(width: 32, height: 0);
  static const wGap36 = SizedBox(width: 36, height: 0);
  static const wGap4 = SizedBox(width: 4, height: 0);
  static const wGap8 = SizedBox(width: 8, height: 0);

  static const hGap12 = SizedBox(width: 0, height: 12);
  static const hGap16 = SizedBox(width: 0, height: 16);
  static const hGap20 = SizedBox(width: 0, height: 20);
  static const hGap24 = SizedBox(width: 0, height: 24);
  static const hGap28 = SizedBox(width: 0, height: 28);
  static const hGap32 = SizedBox(width: 0, height: 32);
  static const hGap36 = SizedBox(width: 0, height: 36);
  static const hGap4 = SizedBox(width: 0, height: 4);
  static const hGap8 = SizedBox(width: 0, height: 8);

  static Color cardColor(BuildContext context) => context.isDarkTheme
      ? context.theme.inputDecorationTheme.fillColor!
      : Colors.white;

  static Color? whiteBackground(BuildContext context) =>
      context.isDarkTheme ? context.theme.backgroundColor : Colors.white;

  static TextStyle? bottomsheetTitleTextStyle(BuildContext context) {
    return context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500);
    // return const TextStyle(
    //   fontSize: 20,
    //   fontWeight: FontWeight.bold,
    // );
  }
}
