import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.choice,
    required this.handlePress,
  });

  final String choice;
  final VoidCallback handlePress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 8,
        ),
        child: ElevatedButton(
          onPressed: handlePress,
          child: Text(choice),
        ),
      ),
    );
  }
}
