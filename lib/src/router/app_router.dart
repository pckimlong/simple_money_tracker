import 'package:simple_money_tracker/src/modules/auth/sign_in_page.dart';
import 'package:simple_money_tracker/src/modules/calendar/calendar_page.dart';
import 'package:simple_money_tracker/src/modules/profile/profile_page.dart';
import 'package:simple_money_tracker/src/modules/report/report_page.dart';
import 'package:simple_money_tracker/src/modules/root/root_page.dart';
import 'package:simple_money_tracker/src/modules/splash/splash_page.dart';
import 'package:simple_money_tracker/src/modules/transaction/transaction_page.dart';

import '../../exports.dart';
import '../modules/account/set_up_account_page.dart';

part "app_router.gr.dart";

final appRouterProvider = Provider<AppRouter>((ref) {
  return AppRouter();
});

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: SplashPage,
    ),
    CustomRoute(
        path: '/root',
        page: RootPage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        children: [
          AutoRoute(
            path: 'transactions',
            page: TransactionPage,
            initial: true,
          ),
          AutoRoute(
            path: 'calendar',
            page: CalendarPage,
          ),
          AutoRoute(
            path: 'report',
            page: ReportPage,
          ),
          AutoRoute(
            path: 'profile',
            page: ProfilePage,
          ),
        ]),
    AutoRoute(
      path: '/sign-in',
      page: SignInPage,
    ),
    AutoRoute(
      path: '/set-up',
      page: SetUpAccountPage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}
