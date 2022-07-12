import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';

import 'app_widget.dart';
import 'exports.dart';
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      if (kDebugMode) {
        await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      }
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      await EasyLocalization.ensureInitialized();
      final prefs = await SharedPreferences.getInstance();
      runApp(
        EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('en'), Locale('km')],
          child: ProviderScope(
            overrides: [
              sharePrefsProvider.overrideWithValue(prefs),
            ],
            child: const AppWidget(),
          ),
        ),
      );
    },
    FirebaseCrashlytics.instance.recordError,
  );
}
