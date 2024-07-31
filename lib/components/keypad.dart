// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rescal/components/button.dart';
import 'package:rescal/utils/operator.dart';

const _highEmphasis = Color(0xFF4B5EFC);
const _mediumEmphasisDarkMode = Color(0xFF4E505F);
const _mediumeEmphasisLightMode = Color(0xFFD2D3DA);
const _lowEmphasisDarkMode = Color(0xFF2E2F38);
const _lowEmphasisLightMode = Color(0xFFFFFFFF);
const _fontStyleDarkMode = TextStyle(fontSize: 32, fontWeight: FontWeight.w300, color: Colors.white);
const _fontStyleLightMode = TextStyle(fontSize: 32, fontWeight: FontWeight.w300, color: Colors.black);

class ButtonInformation{
  final Text? text;
  final Color color;
  final Icon? icon;
  final void Function()? handler;

  const ButtonInformation({this.text, required this.color, this.icon, required this.handler})
      : assert(icon != null || text != null, 'Either icon or text must be provided, but not both.'),
        assert(!(icon != null && text != null), 'Cannot provide both icon and text. Only one is allowed.');

  dynamic get content => text ?? icon;
}


class ButtonRow extends StatelessWidget {
  final List<ButtonInformation> keyRow;
  const ButtonRow({super.key, required this.keyRow});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Button(child: keyRow[0].content, color: keyRow[0].color, onPressed: keyRow[0].handler)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[1].content, color: keyRow[1].color, onPressed: keyRow[1].handler)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[2].content, color: keyRow[2].color, onPressed: keyRow[2].handler)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[3].content, color: keyRow[3].color, onPressed: keyRow[3].handler)
        )
      ]
    );
  }
}

enum ButtonType { number, topOperator, rightOperator }

TextStyle getButtonTextStyle(bool isDarkMode) {
  return isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode;
}

getButtonColor(bool isDarkMode) {
  return isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode;
}

getTopButtonColor(bool isDarkMode) {
  return isDarkMode ? _mediumEmphasisDarkMode : _mediumeEmphasisLightMode;
}

class Keypad extends StatelessWidget {
  final bool isDarkMode;
  final Function onAddValue;
  final Function onAddOperator;
  const Keypad({super.key, required this.isDarkMode, required this.onAddValue, required this.onAddOperator});

  @override
  Widget build(BuildContext context) {
    List<List<ButtonInformation>> keyRows = [
      [
        ButtonInformation(text: Text('C', style: getButtonTextStyle(isDarkMode)), color: getTopButtonColor(isDarkMode), handler: () => onAddOperator(Operator.clear)),
        ButtonInformation(text: Text('⁺/₋', style: getButtonTextStyle(isDarkMode)), color: getTopButtonColor(isDarkMode), handler: () => onAddOperator(Operator.sign)),
        ButtonInformation(text: Text('%', style: getButtonTextStyle(isDarkMode)), color: getTopButtonColor(isDarkMode), handler: () => onAddOperator(Operator.percent)),
        ButtonInformation(text: Text('÷', style: _fontStyleDarkMode), color: _highEmphasis, handler: () => onAddOperator(Operator.divide)),
      ],
      [
        ButtonInformation(text: Text('7', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('7')),
        ButtonInformation(text: Text('8', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('8')),
        ButtonInformation(text: Text('9', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('9')),
        ButtonInformation(text: Text('×', style: _fontStyleDarkMode), color: _highEmphasis, handler: () => onAddOperator(Operator.multiply)),
      ],
      [
        ButtonInformation(text: Text('4', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('4')),
        ButtonInformation(text: Text('5', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('5')),
        ButtonInformation(text: Text('6', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('6')),
        ButtonInformation(text: Text('-', style: _fontStyleDarkMode), color: _highEmphasis, handler: () => onAddOperator(Operator.subtract)),
      ],
      [
        ButtonInformation(text: Text('1', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('1')),
        ButtonInformation(text: Text('2', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('2')),
        ButtonInformation(text: Text('3', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('3')),
        ButtonInformation(text: Text('+', style: _fontStyleDarkMode), color: _highEmphasis, handler: () => onAddOperator(Operator.add)),
      ],
      [
        ButtonInformation(text: Text('.', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddOperator(Operator.decimal)),
        ButtonInformation(text: Text('0', style: getButtonTextStyle(isDarkMode)), color: getButtonColor(isDarkMode), handler: () => onAddValue('0')),
        ButtonInformation(icon: Icon(Icons.backspace_outlined), color: getButtonColor(isDarkMode), handler: () => onAddOperator(Operator.backspace)),
        ButtonInformation(text: Text('=', style: _fontStyleDarkMode), color: _highEmphasis, handler: () => onAddOperator(Operator.equal)),
      ],
    ];
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ButtonRow(keyRow: keyRows[0]),
        ButtonRow(keyRow: keyRows[1]),
        ButtonRow(keyRow: keyRows[2]),
        ButtonRow(keyRow: keyRows[3]),
        ButtonRow(keyRow: keyRows[4]),
      ],
    );
  }
}