import 'package:flutter/material.dart';

import '../core/core.dart';

class MyInkWell extends StatelessWidget {
  const MyInkWell({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: AS.roundedBorderRadius,
        child: child,
      ),
    );
  }
}
