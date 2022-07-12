import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../exports.dart';
import 'src/core/app_styles.dart';
import 'src/router/app_router.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.read(appRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Stock System',
      theme: FlexThemeData.light(
        scheme: FlexScheme.indigo,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 20,
        appBarStyle: FlexAppBarStyle.material,
        tabBarStyle: FlexTabBarStyle.forBackground,
        subThemesData: const FlexSubThemesData(
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
      ),
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = ResponsiveWrapper.builder(
          child,
          // maxWidth: 1200,
          minWidth: 480,
          // defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.resize(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
        );

        return child;
      },
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      routeInformationProvider: appRouter.routeInfoProvider(),
    );
  }
}
