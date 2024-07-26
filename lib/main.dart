import 'package:flutter/material.dart';
import 'package:rescal/pages/calculator.dart';

void main() {
  runApp(const Rescal());
}

class Rescal extends StatefulWidget {
  const Rescal({super.key});

  @override
  State<Rescal> createState() => _RescalState();
}

class _RescalState extends State<Rescal> {
  bool _isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rescal',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: ResponsiveCalculator(onSwitch: _toggleTheme, isDarkMode: _isDarkMode),
    );
  }
}