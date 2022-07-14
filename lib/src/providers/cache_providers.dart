import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_money_tracker/src/core/core.dart';

import '../../exports.dart';

final sharePrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

class CacheProvider {
  const CacheProvider._();

  static final themeMode = StateProvider<ThemeMode>((ref) {
    ref.listenSelf((previous, next) {
      if (next.state != previous?.state) {
        ref.read(sharePrefsProvider).setInt(_themeModeKey, next.state.index);
      }
    });

    final storedIndex = ref.watch(sharePrefsProvider).getInt(_themeModeKey);
    if (storedIndex == null) return ThemeMode.system;
    if (storedIndex > ThemeMode.values.length) return ThemeMode.system;
    return ThemeMode.values[storedIndex];
  }, dependencies: [sharePrefsProvider]);

  static final flexScheme = StateProvider<FlexScheme>((ref) {
    ref.listenSelf((previous, next) {
      if (next.state != previous?.state) {
        ref.read(sharePrefsProvider).setInt(_colorScheme, next.state.index);
      }
    });

    final storedIndex = ref.watch(sharePrefsProvider).getInt(_colorScheme);
    if (storedIndex == null) return FlexScheme.blue;
    if (storedIndex > FlexScheme.values.length) return FlexScheme.blue;
    return FlexScheme.values[storedIndex];
  });

  static final dateFormat = StateProvider<DateFormatPatterns>((ref) {
    ref.listenSelf((previous, next) {
      if (next.state != previous?.state) {
        ref.read(sharePrefsProvider).setInt(_dateFormat, next.state.index);
      }
    });

    final storedIndex = ref.watch(sharePrefsProvider).getInt(_dateFormat);
    if (storedIndex == null) return DateFormatPatterns.ddMMYYYY;
    if (storedIndex > FlexScheme.values.length) return DateFormatPatterns.ddMMYYYY;
    return DateFormatPatterns.values[storedIndex];
  });
}

const _themeModeKey = "themeMode";
const _colorScheme = "colorScheme";
const _dateFormat = "dateFormat";
