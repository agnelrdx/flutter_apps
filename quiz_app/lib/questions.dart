import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  const Questions({super.key, required this.questionText});

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Text(
        questionText,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
