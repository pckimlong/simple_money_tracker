// ignore_for_file: use_build_context_synchronously

import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/account_providers.dart';
import 'package:simple_money_tracker/src/providers/auth_providers.dart';
import 'package:simple_money_tracker/src/providers/category_providers.dart';
import 'package:simple_money_tracker/src/providers/tran_list_providers.dart';
import 'package:simple_money_tracker/src/router/app_router.dart';

import '../../../exports.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthed = ref.watch(AuthProvider.isAuthenticated);
    final isMounted = useIsMounted();
    useEffect(() {
      if (isAuthed.hasValue) {
        final state = isAuthed.valueOrNull ?? false;
        if (state) {
          Future.microtask(() async {
            final isRegistered = await ref.read(AccountProvider.hasSetup.future);
            if (isMounted()) {
              if (isRegistered) {
                /// initialize this in splash
                await ref.read(TranListProvider.streamAll.future);
                await ref.read(CategoryProvider.streamAll.future);
              }
              context.replaceRoute(
                isRegistered ? const RootRoute() : const SetUpAccountRoute(),
              );
            }
          });
        } else {
          context.replaceRoute(const SignInRoute());
        }
      }
      return null;
    }, [isAuthed]);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Splash Page'),
            AS.hGap16,
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
