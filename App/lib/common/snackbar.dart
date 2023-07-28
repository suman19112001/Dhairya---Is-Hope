import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, {color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      content: Text(text),
    ),
  );
}
