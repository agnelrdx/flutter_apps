import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  const Reset({super.key, required this.handleReset});

  final VoidCallback handleReset;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: handleReset,
      child: const Text('Start over!'),
    );
  }
}
