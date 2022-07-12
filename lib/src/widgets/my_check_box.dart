import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyCheckBox extends HookWidget {
  const MyCheckBox({
    Key? key,
    this.initial = false,
    required this.onPress,
  }) : super(key: key);

  final Function(bool?) onPress;
  final bool initial;

  @override
  Widget build(BuildContext context) {
    final isCompleted = useState(initial);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          checkColor: theme.colorScheme.secondary,
          activeColor: Colors.transparent,
          value: isCompleted.value,
          side: BorderSide(width: 0.8, color: theme.colorScheme.onSurface),
          shape: const CircleBorder(),
          onChanged: (_) {
            isCompleted.value = !initial;
            onPress(_);
          },
        ),
      ),
    );
  }
}
