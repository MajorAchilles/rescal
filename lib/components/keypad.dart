// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rescal/components/button.dart';

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

  const ButtonInformation({this.text, required this.color, this.icon})
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
          child: Button(child: keyRow[0].content, color: keyRow[0].color)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[1].content, color: keyRow[1].color)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[2].content, color: keyRow[2].color)
        ),
        SizedBox.square(
          dimension: 16,
        ),
        Expanded(
          child: Button(child: keyRow[3].content, color: keyRow[3].color)
        )
      ]
    );
  }
}

class Keypad extends StatelessWidget {
  final bool isDarkMode;
  const Keypad({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    List<List<ButtonInformation>> keyRows = [
      [
        ButtonInformation(text: Text('C', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _mediumEmphasisDarkMode : _mediumeEmphasisLightMode),
        ButtonInformation(text: Text('⁺/₋', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _mediumEmphasisDarkMode : _mediumeEmphasisLightMode),
        ButtonInformation(text: Text('%', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _mediumEmphasisDarkMode : _mediumeEmphasisLightMode),
        ButtonInformation(text: Text('÷', style: _fontStyleDarkMode), color: _highEmphasis),
      ],
      [
        ButtonInformation(text: Text('7', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('8', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('9', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('×', style: _fontStyleDarkMode), color: _highEmphasis),
      ],
      [
        ButtonInformation(text: Text('4', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('5', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('6', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('-', style: _fontStyleDarkMode), color: _highEmphasis),
      ],
      [
        ButtonInformation(text: Text('1', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('2', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('3', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('+', style: _fontStyleDarkMode), color: _highEmphasis),
      ],
      [
        ButtonInformation(text: Text('.', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('0', style: isDarkMode ? _fontStyleDarkMode : _fontStyleLightMode), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(icon: Icon(Icons.backspace_outlined), color: isDarkMode ? _lowEmphasisDarkMode : _lowEmphasisLightMode),
        ButtonInformation(text: Text('=', style: _fontStyleDarkMode), color: _highEmphasis),
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