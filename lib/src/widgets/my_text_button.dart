import 'package:flutter/material.dart';

import '../core/core.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPress;
  final String text;
  @override
  Widget build(BuildContext context) {
    var isDisabled = onPress == null;

    return InkWell(
      onTap: onPress,
      borderRadius: AS.roundedBorderRadius,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          text,
          style: TextStyle(
            color: isDisabled ? Colors.grey : Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
