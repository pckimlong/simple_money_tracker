import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Matrix4;

class Shaker extends StatefulWidget {
  const Shaker({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<Shaker> createState() => ShakerState();
}

class ShakerState extends State<Shaker> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 550), // how long the shake happens
    )..addListener(() => setState(() {}));

    animation = Tween<double>(
      begin: 00.0,
      end: 120.0,
    ).animate(animationController);
  }

  Vector3 _shake() {
    double progress = animationController.value;
    double offset = sin(progress * pi * 80.0);
    return Vector3(offset * 2, 0.0, 0.0);
  }

  shake() {
    animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translation(_shake()),
      child: widget.child,
    );
  }
}
