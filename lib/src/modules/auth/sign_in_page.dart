import 'package:flutterfire_ui/auth.dart';
import 'package:simple_money_tracker/src/providers/auth_providers.dart';
import 'package:simple_money_tracker/src/router/app_router.dart';

import '../../../exports.dart';

class SignInPage extends ConsumerWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<bool>>(
      AuthProvider.isAuthenticated,
      (previous, next) {
        if (next.valueOrNull ?? false) {
          context.replaceRoute(const RootRoute());
        }
      },
    );

    return SignInScreen(
      auth: ref.watch(firebaseAuthProvider),
      providerConfigs: const [
        EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: 'clientId'),
        FacebookProviderConfiguration(clientId: "clientId"),
        PhoneProviderConfiguration(),
      ],
    );
  }
}
