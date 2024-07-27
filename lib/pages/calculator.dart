import 'package:flutter/material.dart';
import 'package:rescal/components/header.dart';
import 'package:rescal/components/keypad.dart';
import 'package:rescal/components/screen.dart';

class ResponsiveCalculator extends StatefulWidget {
  final void Function() onSwitch;
  final bool isDarkMode;
  const ResponsiveCalculator({super.key, required this.onSwitch, required this.isDarkMode});

  @override
  State<ResponsiveCalculator> createState() => _ResponsiveCalculatorState();
}

class _ResponsiveCalculatorState extends State<ResponsiveCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Header(onSwitch: widget.onSwitch, isDarkMode: widget.isDarkMode),
          const Column(
            children: [
              Row(
                children: [
                  Expanded(child: Screen(firstRow: '0', secondRow: '0')),
                ],
              ),
              SizedBox(height: 550.0, child: Keypad()),
            ],
          ),
        ],),
      )
    );
  }
}