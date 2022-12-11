import 'package:flutter/material.dart';

class ScoreTitle extends StatelessWidget {
  const ScoreTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Score',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
