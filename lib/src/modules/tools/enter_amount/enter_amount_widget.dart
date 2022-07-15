import 'dart:developer';

import 'package:simple_money_tracker/src/core/core.dart';

import '../../../../exports.dart';
import '../../../widgets/widgets.dart';
import 'enter_amount_provider.dart';
import 'enter_amount_state.dart';

class EnterAmountWidget extends HookConsumerWidget {
  const EnterAmountWidget({
    Key? key,
    this.initialNumber,
    required this.onDisplayTextChanged,
    required this.onDonePressed,
    required this.onResultChanged,
    this.isProgressing = false,
    this.onError,
  }) : super(key: key);

  final void Function(String? message)? onError;
  final num? initialNumber;
  final void Function(String value) onDisplayTextChanged;
  final void Function(num? value) onResultChanged;
  final void Function(num value) onDonePressed;
  final bool isProgressing;

  void _bindInitialValue(WidgetRef ref) {
    useMemoized(() {
      Future.microtask(() {
        if (initialNumber != null) {
          ref.read(enterAmountProvider.notifier).bindInitialValue(initialNumber!);
        }
      });
    });
  }

  void _listen(WidgetRef ref, GlobalKey<ShakerState> shakeKey) {
    ref.listen<EnterAmountState>(enterAmountProvider, (previous, next) {
      onResultChanged(next.result);
      if (previous?.calItems != next.calItems) {
        ref.read(enterAmountProvider.notifier).clearValueError();
        onDisplayTextChanged(next.displayText);
      }
      if (previous!.valueErrorMgs.isNone() && next.valueErrorMgs.isSome()) {
        final mgs = next.valueErrorMgs.getOrElse(() => 'Something wrong!');
        log(mgs);
        if (onError != null) {
          onError!(mgs);
        }
      }
      if (previous.incorrecFormat == false && next.incorrecFormat == true) {
        shakeKey.currentState!.shake();
      }
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shakeKey = useMemoized(() => GlobalKey<ShakerState>());
    final controller = ref.watch(enterAmountProvider.notifier);

    _bindInitialValue(ref);
    _listen(ref, shakeKey);

    return Shaker(
      key: shakeKey,
      child: Stack(
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.7,
            ),
            children: [
              _Button(
                greyColor: true,
                onTap: () =>
                    controller.mapStateToEvent(const EnterAmountEvent.clearPress()),
                child: const Text('C'),
              ),
              _Button(
                greyColor: true,
                onTap: () => controller.mapStateToEvent(
                    const EnterAmountEvent.operatorPress(CalculatorItem.divide())),
                child: const Text('/'),
              ),
              _Button(
                greyColor: true,
                onTap: () => controller.mapStateToEvent(
                    const EnterAmountEvent.operatorPress(CalculatorItem.multiply())),
                child: const Text('*'),
              ),
              _Button(
                greyColor: true,
                onTap: () =>
                    controller.mapStateToEvent(const EnterAmountEvent.backspacePress()),
                child: const Icon(Icons.backspace_outlined),
              ),
              const _Button(number: 7),
              const _Button(number: 8),
              const _Button(number: 9),
              _Button(
                greyColor: true,
                onTap: () => controller.mapStateToEvent(
                    const EnterAmountEvent.operatorPress(CalculatorItem.substract())),
                child: const Text('-'),
              ),
              const _Button(number: 4),
              const _Button(number: 5),
              const _Button(number: 6),
              _Button(
                greyColor: true,
                onTap: () => controller.mapStateToEvent(
                    const EnterAmountEvent.operatorPress(CalculatorItem.add())),
                child: const Text('+'),
              ),
              const _Button(number: 1),
              const _Button(number: 2),
              const _Button(number: 3),
              Container(),
              _Button(
                onTap: () =>
                    controller.mapStateToEvent(const EnterAmountEvent.dotPress()),
                child: const Text('.'),
              ),
              const _Button(number: 0),
              _Button(
                onTap: () =>
                    controller.mapStateToEvent(const EnterAmountEvent.threeZeroPress()),
                child: const Text('000'),
              ),
              Container(),
            ],
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: MediaQuery.of(context).size.width / 4 - 2,
                height: MediaQuery.of(context).size.width / 4 + 16,
                child: Material(
                  color: Colors.transparent,
                  child: _SubmitButton(
                    onSubmitPressed: onDonePressed,
                    isProgressing: isProgressing,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton({
    Key? key,
    required this.onSubmitPressed,
    this.isProgressing = false,
  }) : super(key: key);

  final void Function(num value) onSubmitPressed;
  final bool isProgressing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(enterAmountProvider.notifier);
    final color = context.colors.onPrimary;

    final showEqualButton =
        ref.watch(enterAmountProvider.select((value) => value.showEqualButton));

    return InkWell(
      onTap: showEqualButton
          ? () => controller.mapStateToEvent(const EnterAmountEvent.equalPress())
          : () {
              final value = ref.read(enterAmountProvider).result!;
              onSubmitPressed(value);
            },
      child: Center(
        child: showEqualButton
            ? Text(
                '=',
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              )
            : isProgressing
                ? CircularProgressIndicator(color: color)
                : Icon(Icons.check, color: color, size: 32),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button({
    Key? key,
    this.onTap,
    this.child,
    this.number,
    this.greyColor = false,
  }) : super(key: key);

  final Widget? child;
  final bool greyColor;
  final int? number;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor
            ? Theme.of(context).scaffoldBackgroundColor
            : AS.whiteBackground(context),
        border: Border.all(
          color: Theme.of(context).hintColor.withOpacity(0.1),
          width: 0.6,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: number != null
              ? () => ref
                  .read(enterAmountProvider.notifier)
                  .mapStateToEvent(EnterAmountEvent.numberPress(number!))
              : onTap,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(child: child ?? Text("$number")),
          ),
        ),
      ),
    );
  }
}
