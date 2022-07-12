import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/cache_providers.dart';

import '../../../exports.dart';
import 'src/router/app_router.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);
    final themeMode = ref.watch(CacheProvider.themeMode);
    final flexScheme = ref.watch(CacheProvider.flexScheme);

    return MaterialApp.router(
      title: 'Money Tracker',
      debugShowCheckedModeBanner: false,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      routeInformationProvider: appRouter.routeInfoProvider(),
      theme: AppTheme.lightTheme(flexScheme),
      darkTheme: AppTheme.darkTheme(flexScheme),
      themeMode: themeMode,
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = ResponsiveWrapper.builder(
          child,
          minWidth: 480,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        );

        return child;
      },
    );
  }
}
