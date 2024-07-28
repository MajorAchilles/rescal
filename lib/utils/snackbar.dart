import 'package:flutter/material.dart';

void showSnackbar(String message, BuildContext context, {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      behavior: SnackBarBehavior.floating,
      backgroundColor: isError ? Colors.pink : Colors.lightBlue,
    )
  );
}