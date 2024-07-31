import 'package:flutter/material.dart';

const _secondRowColorDarkMode = Color(0xFF747474);
const _secondRowColorLightMode = Color(0xFF919191);

class Screen extends StatelessWidget {
  final String? firstRow;
  final String? secondRow;
  final bool isDarkMode;

  const Screen({super.key, required this.firstRow, this.secondRow, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          firstRow ?? '',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w300,
            color: isDarkMode ? _secondRowColorDarkMode : _secondRowColorLightMode,
          ),
        ),
        Text(
          secondRow ?? '',
          style: const TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}