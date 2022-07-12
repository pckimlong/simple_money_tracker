// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashPage());
    },
    RootRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const RootPage(),
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    SignInRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SignInPage());
    },
    SetUpAccountRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SetUpAccountPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(RootRoute.name, path: '/root'),
        RouteConfig(SignInRoute.name, path: '/sign-in'),
        RouteConfig(SetUpAccountRoute.name, path: '/set-up')
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute() : super(RootRoute.name, path: '/root');

  static const String name = 'RootRoute';
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [SetUpAccountPage]
class SetUpAccountRoute extends PageRouteInfo<void> {
  const SetUpAccountRoute() : super(SetUpAccountRoute.name, path: '/set-up');

  static const String name = 'SetUpAccountRoute';
}
