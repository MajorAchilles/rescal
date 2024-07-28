import 'package:flutter/material.dart';
import 'package:rescal/utils/snackbar.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Color? color;
  final void Function()? onPressed;
  const Button({super.key, required this.child, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: null,
      height: 75,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onPressed ?? () { showSnackbar('Button pressed', context);},
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}