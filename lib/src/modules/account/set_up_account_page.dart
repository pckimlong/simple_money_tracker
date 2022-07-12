import 'package:currency_picker/currency_picker.dart';
import 'package:simple_money_tracker/src/core/core.dart';
import 'package:simple_money_tracker/src/providers/account_setup_providers.dart';
import 'package:simple_money_tracker/src/widgets/widgets.dart';

import '../../../exports.dart';

class SetUpAccountPage extends HookConsumerWidget {
  const SetUpAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AS.sidePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _Currency(),
            AS.hGap16,
            _InitialBalance(),
          ],
        ),
      ),
      bottomNavigationBar: const _SaveButton(),
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saveState = ref.watch(AccountSetUpProvider.save);
    // ref.listen<Failure?>(
    //   AccountSetUpProvider.save.select((value) => value.error as Failure?),
    //   (previous, next) {
    //     if (next != null) {
    //       EasyLoading.showError(next.message ?? "Something went wrong!");
    //     }
    //   },
    // );

    return Padding(
      padding: const EdgeInsets.all(AS.sidePadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (saveState.hasError) ...[
            Text(
              saveState.error.toString(),
              style: context.theme.errorTextStyle,
            ),
            AS.hGap8,
          ],
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await ref.read(AccountSetUpProvider.save.notifier).call();
              },
              child: saveState.isLoading
                  ? SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: context.colors.onPrimary,
                      ),
                    )
                  : const Text('SAVE'),
            ),
          ),
        ],
      ),
    );
  }
}

class _Currency extends ConsumerWidget {
  const _Currency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyOption =
        ref.watch(AccountSetUpProvider.data.select((value) => value.defaultCurrency));

    return Column(
      children: [
        const Text('Choose default currency'),
        AS.hGap4,
        InkWell(
          onTap: () {
            showCurrencyPicker(
              context: context,
              favorite: ['KHR', 'USD'],
              onSelect: ref.read(AccountSetUpProvider.data.notifier).onCurrencyChanged,
              theme: CurrencyPickerThemeData(
                shape: const RoundedRectangleBorder(
                  borderRadius: AS.roundedBorderRadius,
                ),
              ),
            );
          },
          child: TextFieldLikeContainer(
            child: Center(
              child: currencyOption.match(
                (currency) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(CurrencyUtils.currencyToEmoji(currency)),
                    AS.wGap8,
                    Text("${currency.code} - ${currency.name} (${currency.symbol})"),
                  ],
                ),
                () => const Text('Choose currency'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _InitialBalance extends HookConsumerWidget {
  const _InitialBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '0');

    return MyTextFormField(
      controller: controller,
      hintText: 'Initial balance',
      prefixIcon: const Icon(Icons.abc),
    );
  }
}
