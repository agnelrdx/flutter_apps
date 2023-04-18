import 'package:flutter/material.dart';

import 'package:quiz_app/game_title.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/answer_button.dart';

class QuestionBoard extends StatelessWidget {
  const QuestionBoard({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.handlePress,
  });

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(String) handlePress;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GameTitle(),
          Questions(
            questionText: questions[questionIndex]['title'] as String,
          ),
          ...(questions[questionIndex]['choices'] as List<String>)
              .map((choice) {
            return AnswerButton(
              choice: choice,
              handlePress: () => handlePress(choice),
            );
          }).toList(),
        ],
      ),
    );
  }
}
