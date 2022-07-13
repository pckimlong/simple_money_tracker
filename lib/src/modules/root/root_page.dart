import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/router/app_router.dart';

import '../../../exports.dart';

class RootPage extends ConsumerWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        TransactionRoute(),
        CalendarRoute(),
        ReportRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tab) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: AS.cardColor(context),
            child: SalomonBottomBar(
              itemShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AS.radiusValue),
              ),
              currentIndex: tab.activeIndex,
              onTap: tab.setActiveIndex,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.list),
                  title: const Text('Transaction'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.calendar_month_outlined),
                  title: const Text('Calendar'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.bar_chart_outlined),
                  title: const Text('Report'),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.account_circle_outlined),
                  title: const Text('Profile'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
