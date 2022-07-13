import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:simple_money_tracker/exports.dart';

import 'core.dart';

class AppTheme {
  static ThemeData lightTheme(FlexScheme flexScheme) {
    final lightTheme = FlexThemeData.light(
      scheme: flexScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.material,
      tabBarStyle: FlexTabBarStyle.forBackground,
      subThemesData: const FlexSubThemesData(
        inputDecoratorBorderType: FlexInputBorderType.outline,
        blendOnLevel: 20,
        blendOnColors: false,
        defaultRadius: AS.radiusValue,
        inputDecoratorUnfocusedHasBorder: false,
        popupMenuElevation: 8,
        useTextTheme: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      // useMaterial3: true,
    );
    return lightTheme.copyWith(
      inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(isDense: true),
    );
  }

  static ThemeData darkTheme(FlexScheme flexScheme) {
    final lightTheme = FlexThemeData.dark(
      scheme: flexScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 20,
      appBarStyle: FlexAppBarStyle.material,
      tabBarStyle: FlexTabBarStyle.forBackground,
      subThemesData: const FlexSubThemesData(
        inputDecoratorBorderType: FlexInputBorderType.outline,
        blendOnLevel: 20,
        blendOnColors: false,
        defaultRadius: AS.radiusValue,
        inputDecoratorUnfocusedHasBorder: false,
        popupMenuElevation: 8,
        useTextTheme: true,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true,
    );
    return lightTheme.copyWith(
      inputDecorationTheme: lightTheme.inputDecorationTheme.copyWith(isDense: true),
    );
  }
}
