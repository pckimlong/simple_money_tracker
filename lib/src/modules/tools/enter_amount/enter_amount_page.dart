import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_money_tracker/src/core/core.dart';

import '../../../widgets/widgets.dart';
import 'enter_amount_provider.dart';
import 'enter_amount_state.dart';

class EnterAmountPage extends HookConsumerWidget {
  const EnterAmountPage({
    Key? key,
    required this.initialNumber,
  }) : super(key: key);

  final num? initialNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(enterAmountProvider.notifier);

    // Only modified state 1 time
    useMemoized(() {
      Future.microtask(() {
        if (initialNumber != null) {
          controller.bindInitialValue(initialNumber!);
        }
      });
    });

    final shakeKey = useMemoized(() => GlobalKey<ShakerState>());

    /// Reset if there error
    ref.listen<EnterAmountState>(enterAmountProvider, (previous, next) {
      if (previous?.calItems != next.calItems) {
        ref.read(enterAmountProvider.notifier).clearValueError();
      }
      if (previous!.valueErrorMgs.isNone() && next.valueErrorMgs.isSome()) {
        final mgs = next.valueErrorMgs.getOrElse(() => 'Something wrong!');
      }
      if (previous.incorrecFormat == false && next.incorrecFormat == true) {
        shakeKey.currentState!.shake();
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        title: const Text('Enter amount'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(ref.watch(enterAmountProvider).toString()),
          const Expanded(
            child: Align(alignment: Alignment.bottomCenter, child: _Result()),
          ),
          Shaker(
            key: shakeKey,
            child: Card(
              color: Theme.of(context).colorScheme.primary,
              child: Stack(
                children: [
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1.8,
                    ),
                    children: [
                      _Button(
                        greyColor: true,
                        onTap: () => controller
                            .mapStateToEvent(const EnterAmountEvent.clearPress()),
                        child: const Text('C'),
                      ),
                      _Button(
                        greyColor: true,
                        onTap: () => controller.mapStateToEvent(
                            const EnterAmountEvent.operatorPress(
                                CalculatorItem.divide())),
                        child: const Text('/'),
                      ),
                      _Button(
                        greyColor: true,
                        onTap: () => controller.mapStateToEvent(
                            const EnterAmountEvent.operatorPress(
                                CalculatorItem.multiply())),
                        child: const Text('*'),
                      ),
                      _Button(
                        greyColor: true,
                        onTap: () => controller
                            .mapStateToEvent(const EnterAmountEvent.backspacePress()),
                        child: const Icon(Icons.backspace_outlined),
                      ),
                      const _Button(number: 7),
                      const _Button(number: 8),
                      const _Button(number: 9),
                      _Button(
                        greyColor: true,
                        onTap: () => controller.mapStateToEvent(
                            const EnterAmountEvent.operatorPress(
                                CalculatorItem.substract())),
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
                        onTap: () => controller
                            .mapStateToEvent(const EnterAmountEvent.dotPress()),
                        child: const Text('.'),
                      ),
                      const _Button(number: 0),
                      _Button(
                        onTap: () => controller
                            .mapStateToEvent(const EnterAmountEvent.threeZeroPress()),
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
                        height: MediaQuery.of(context).size.width / 4 + 8,
                        child: const Material(
                          color: Colors.transparent,
                          child: _SubmitButton(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmitButton extends ConsumerWidget {
  const _SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(enterAmountProvider.notifier);

    final showEqualButton =
        ref.watch(enterAmountProvider.select((value) => value.showEqualButton));

    return InkWell(
      onTap: showEqualButton
          ? () => controller.mapStateToEvent(const EnterAmountEvent.equalPress())
          : () {
              final state = ref.read(enterAmountProvider);
              AutoRouter.of(context).pop<num>(state.result);
            },
      child: Center(
        child: showEqualButton
            ? const Text(
                '=',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
              )
            : const Icon(
                Icons.check,
                color: Colors.white,
                size: 32,
              ),
      ),
    );
  }
}

class _Result extends ConsumerWidget {
  const _Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(enterAmountProvider.select((value) => value.calItems));
    final invalid =
        ref.watch(enterAmountProvider.select((value) => value.incorrecFormat));

    String displayText = result
        .map(
          (e) => e.when(
            add: () => "+",
            divide: () => "/",
            multiply: () => "*",
            number: (n) {
              /// it throw exeption if string contain only "-"
              /// Because we need to format it below
              if (n == "-") return n;

              final a = NumberFormat.decimalPattern();
              final s = a.format(double.parse(n));
              // fix . at the end not show
              if (n.getLastChar() == ".") {
                return "$s.";
              }

              // If last digit is zero after decimal point, show it too
              // Make sure there 3 char3
              if (n.length >= 3 && n.contains(".")) {
                final decimal = n.split(".").last;
                if (decimal == "0") {
                  return "$s.0";
                } else if (decimal == "00") {
                  return "$s.00";
                } else if (decimal.length == 2 && decimal.getLastChar() == "0") {
                  return "${s}0";
                }
              }

              return s;
            },
            substract: () => "-",
          ),
        )
        .join();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      width: double.infinity,
      child: Text(
        displayText,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 42,
          overflow: TextOverflow.fade,
          color: invalid ? Colors.red : Colors.black,
        ),
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

  final VoidCallback? onTap;
  final Widget? child;
  final int? number;
  final bool greyColor;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      decoration: BoxDecoration(
        color: greyColor ? Theme.of(context).scaffoldBackgroundColor : Colors.white,
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
