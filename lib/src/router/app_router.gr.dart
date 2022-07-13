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
    },
    TransactionRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const TransactionPage());
    },
    CalendarRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const CalendarPage());
    },
    ReportRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ReportPage());
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ProfilePage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(RootRoute.name, path: '/root', children: [
          RouteConfig('#redirect',
              path: '',
              parent: RootRoute.name,
              redirectTo: 'transactions',
              fullMatch: true),
          RouteConfig(TransactionRoute.name,
              path: 'transactions', parent: RootRoute.name),
          RouteConfig(CalendarRoute.name,
              path: 'calendar', parent: RootRoute.name),
          RouteConfig(ReportRoute.name, path: 'report', parent: RootRoute.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile', parent: RootRoute.name)
        ]),
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
  const RootRoute({List<PageRouteInfo>? children})
      : super(RootRoute.name, path: '/root', initialChildren: children);

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

/// generated route for
/// [TransactionPage]
class TransactionRoute extends PageRouteInfo<void> {
  const TransactionRoute() : super(TransactionRoute.name, path: 'transactions');

  static const String name = 'TransactionRoute';
}

/// generated route for
/// [CalendarPage]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute() : super(CalendarRoute.name, path: 'calendar');

  static const String name = 'CalendarRoute';
}

/// generated route for
/// [ReportPage]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: 'report');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
