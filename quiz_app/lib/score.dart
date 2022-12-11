import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key, required this.finalScore});

  final int finalScore;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$finalScore',
      style: const TextStyle(
        fontSize: 150,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
