import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  final String? firstRow;
  final String? secondRow;

  const Screen({super.key, required this.firstRow, this.secondRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '0',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w100,
            ),
          ),
          Text(
            '0',
            style: TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}