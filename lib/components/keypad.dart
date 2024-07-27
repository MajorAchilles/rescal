// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rescal/components/button.dart';

const _fontStyle = TextStyle(fontSize: 32, fontWeight: FontWeight.w300);
const _highEmphasis = Color(0xFF4B5EFC);
const _lowEmphasisDark = Color(0xFF4E505F);
const _lowEmphasis = Color(0xFF2E2F38);

class ButtonText extends StatelessWidget {
  final String text;

  const ButtonText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: _fontStyle,);
  }
}

class Keypad extends StatelessWidget {
  const Keypad({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              color: _lowEmphasisDark,
              child: ButtonText(text: 'C'),
            ),
            Button(
              color: _lowEmphasisDark,
              child: ButtonText(text: '⁺/₋')
            ),
            Button(
              color: _lowEmphasisDark,
              child: ButtonText(text: '%'),
            ),
            Button(
              color: _highEmphasis,
              child: ButtonText(text: '÷'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '7'),
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '8')
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '9'),
            ),
            Button(
              color: _highEmphasis,
              child: ButtonText(text: '×'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '4'),
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '5')
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '6'),
            ),
            Button(
              color: _highEmphasis,
              child: ButtonText(text: '-'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '1'),
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '2')
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '3'),
            ),
            Button(
              color: _highEmphasis,
              child: ButtonText(text: '+'),
            ),
          ],
        ),
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '.'),
            ),
            Button(
              color: _lowEmphasis,
              child: ButtonText(text: '0')
            ),
            Button(
              color: _lowEmphasis,
              child: Icon(Icons.backspace),
            ),
            Button(
              color: _highEmphasis,
              child: ButtonText(text: '='),
            ),
          ],
        ),
      ],
    );
  }
}