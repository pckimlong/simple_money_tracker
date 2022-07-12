import 'package:simple_money_tracker/src/providers/auth_providers.dart';
import 'package:simple_money_tracker/src/router/app_router.dart';

import '../../../exports.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthed = ref.watch(AuthProvider.isAuthenticated);
    useEffect(() {
      if (isAuthed.hasValue) {
        context.replaceRoute(
          isAuthed.valueOrNull! ? const RootRoute() : const SignInRoute(),
        );
      }
      return null;
    }, [isAuthed]);

    return const Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
