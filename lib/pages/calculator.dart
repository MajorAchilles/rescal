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
  String _firstRow = "";
  String _secondRow = "";

  void addInput(String value) {
    print(value);
    double input = double.tryParse(value) ?? 0;

    double? firstInput = _firstInput;
    double? secondInput = _secondInput;

    if (_operator == null) {
      if (_firstInput == null) {
        firstInput = input;
      } else {
        firstInput = (_firstInput! * 10) + input;
      }
    } else {
      if (_secondInput == null) {
        secondInput = input;
      } else {
        secondInput = (_secondInput! * 10) + input;
      }
    }
    setState(() {
      _firstInput = firstInput;
      _secondInput = secondInput;
      _firstRow = convertToHumanReadableString(_previousFirstInput, _previousSecondInput, _previousOperator);
      _secondRow = convertToHumanReadableString(firstInput, secondInput, _operator);
    });
  }

  void addOperator(Operator newOperator) {
    print(newOperator);

    double? firstInput = _firstInput;
    double? secondInput = _secondInput;
    double? previousFirstInput = _previousFirstInput;
    double? previousSecondInput = _previousSecondInput;
    Operator? previousOperator = _previousOperator;
    Operator? operator = _operator;

    if (firstInput == null) {
      return;
    }

    switch (newOperator) {
      case Operator.clear:
        firstInput = null;
        secondInput = null;
        operator = null;
        previousFirstInput = null;
        previousSecondInput = null;
        previousOperator = null;
        break;
      case Operator.equal:
        secondInput ??= 0;
        operator ??= newOperator;

        previousFirstInput = firstInput;
        previousOperator = operator;
        previousSecondInput = secondInput;

        firstInput = calculate();
        secondInput = null;
        operator = null;
      case Operator.sign:
        if (operator == null) {
          firstInput = -firstInput;
        } else {
          secondInput = -secondInput!;
        }
        break;
      case Operator.backspace:
        if (operator == null) {
          firstInput = (firstInput ~/ 10).toDouble();
        } else {
          secondInput = (secondInput! ~/ 10).toDouble();
        }
        break;
      case Operator.decimal:
        if (operator == null) {
          if (!firstInput.toString().contains(".")) {
            firstInput = firstInput! + 0.0;
          }
        } else {
          if (!secondInput.toString().contains(".")) {
            secondInput = secondInput! + 0.0;
          }
        }
        break;
      case Operator.percent:
        if (operator == null) {
          firstInput = firstInput / 100;
        } else {
          secondInput = secondInput! / 100;
        }
        break;
      case Operator.divide:
      case Operator.multiply:
      case Operator.subtract:
      case Operator.add:
        operator = newOperator;
        break;
    }

    setState(() {
      _firstInput = firstInput;
      _secondInput = secondInput;
      _operator = operator;
      _previousFirstInput = previousFirstInput;
      _previousSecondInput = previousSecondInput;
      _previousOperator = previousOperator;
      _firstRow = convertToHumanReadableString(previousFirstInput, previousSecondInput, previousOperator);
      _secondRow = convertToHumanReadableString(firstInput, secondInput, operator);
    });
  }
  double calculate() {
    if (_firstInput == null) {
      return 0;
    }

    if (_secondInput == null) {
      return _firstInput!;
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
      case Operator.equal:
        return _firstInput!;
      default:
        return 0;
    }
  }

  String convertToHumanReadableString(double? first, double? second, Operator? operator) {
    if (first == null) {
      return "";
    }

    String firstString = "$first";
    if (firstString.endsWith(".0")) {
      firstString = firstString.substring(0, firstString.length - 2);
    }

    if (first < 0) {
      firstString = "($firstString)";
    }

    if (operator == null || operator == Operator.equal) {
      return firstString;
    }

    if (second == null) {
      return "$firstString ${getHumanReadableString(operator)}";
    }

    String secondString = "$second";
    if (secondString.endsWith(".0")) {
      secondString = secondString.substring(0, secondString.length - 2);
    }

    if (second < 0) {
      secondString = "($secondString)";
    }


    return "$firstString ${getHumanReadableString(operator)} $secondString";
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
                  Expanded(child: Screen(firstRow: _firstRow, secondRow: _secondRow, isDarkMode: isDarkMode)),
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