import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Color? color;
  const Button({super.key, required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 84,
      height: 84,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: color),
        child: Center(child: child),
      ),
    );
  }
}