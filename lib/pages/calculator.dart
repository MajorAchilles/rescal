import 'package:flutter/material.dart';
import 'package:rescal/components/header.dart';
import 'package:rescal/components/keypad.dart';
import 'package:rescal/components/screen.dart';
import 'package:rescal/utils/operator.dart';

const _lightModeBackgroundColor = Color(0xFFF1F2F3);
const _darkModeBackgroundColor = Color(0xFF000000);


class ResponsiveCalculator extends StatefulWidget {
  final void Function() onSwitch;
  final bool isDarkMode;

  const ResponsiveCalculator({super.key, required this.onSwitch, required this.isDarkMode});

  @override
  State<ResponsiveCalculator> createState() => _ResponsiveCalculatorState();
}

class _ResponsiveCalculatorState extends State<ResponsiveCalculator> {
  double? _firstInput;
  double? _secondInput;
  double? _previousFirstInput;
  double? _previousSecondInput;
  Operator? _operator;
  Operator? _previousOperator;

  void addInput(String value) {
    print(value);
    double input = double.tryParse(value) ?? 0;

    if (_operator == null) {
      if (_firstInput == null) {
        _firstInput = input;
      } else {
        _firstInput = (_firstInput! * 10) + input;
      }
    } else {
      if (_secondInput == null) {
        _secondInput = input;
      } else {
        _secondInput = (_secondInput! * 10) + input;
      }
    }
  }

  void addOperator(Operator newOperator) {
    if (_firstInput == null) {
      return;
    }

    print(newOperator);
    if (newOperator == Operator.clear) {
      setState(() {
        _firstInput = null;
        _secondInput = null;
        _operator = null;
        _previousFirstInput = null;
        _previousSecondInput = null;
        _previousOperator = null;
      });
      return;
    }

    if (_operator == null) {
      if (newOperator == Operator.sign) {
        setState(() {
          _firstInput == -_firstInput!;
        });
      }

      if (newOperator == Operator.percent) {
        setState(() {
          _firstInput == _firstInput! / 100;
        });
      }

      if (newOperator == Operator.backspace) {
        setState(() {
          _firstInput == (_firstInput! / 10).floorToDouble();
        });
      }

      if (newOperator == Operator.decimal) {
        setState(() {
          _firstInput == _firstInput! + 0.1;
        });
      }
    } else {
      if (_secondInput == null) {
        return;
      }

      if (newOperator == Operator.sign) {
        setState(() {
          _secondInput == -_secondInput!;
        });
      }

      if (newOperator == Operator.percent) {
        setState(() {
          _secondInput == _secondInput! / 100;
        });
      }

      if (newOperator == Operator.backspace) {
        setState(() {
          _secondInput == (_secondInput! / 10).floorToDouble();
        });
      }

      if (newOperator == Operator.decimal) {
        setState(() {
          _secondInput == _secondInput! + 0.1;
        });
      }
    }

    if (newOperator == Operator.equal) {
      setState(() {
        _firstInput ??= 0;
        _secondInput ??= 0;
        _operator ??= Operator.equal;

        _previousFirstInput = _firstInput!;
        _previousOperator = _operator;
        _previousSecondInput = _secondInput!;

        _firstInput = calculate();
        _secondInput = 0;
        _operator = null;
      });
      print(_firstInput);
      return;
    }

    setState(() {
      _operator = newOperator;
    });
  }
  double calculate() {
    if (_firstInput == null || _secondInput == null) {
      return 0;
    }

    switch (_operator) {
      case Operator.add:
        return _firstInput! + _secondInput!;
      case Operator.subtract:
        return _firstInput! - _secondInput!;
      case Operator.multiply:
        return _firstInput! * _secondInput!;
      case Operator.divide:
        return _firstInput! / _secondInput!;
      default:
        return 0;
    }
  }

  String getOutput() {
    return "$_firstInput $_operator $_secondInput";
  }

  String getPreviousOutput() {
    return "$_previousFirstInput $_previousOperator $_previousSecondInput";
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = widget.isDarkMode;

    return Scaffold(
      backgroundColor: isDarkMode ? _darkModeBackgroundColor : _lightModeBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24, top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Header(onSwitch: widget.onSwitch, isDarkMode: isDarkMode),
          Column(
            children: [
              Row(
                children: [
                  Expanded(child: Screen(firstRow: getPreviousOutput(), secondRow: getOutput(), isDarkMode: isDarkMode)),
                ],
              ),
              SizedBox(height: 450.0, child: Keypad(
                isDarkMode: isDarkMode,
                onAddValue: addInput,
                onAddOperator: addOperator
              )),
            ],
          ),
        ],),
      )
    );
  }
}