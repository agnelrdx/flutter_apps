import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Let see how much you score!!',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
