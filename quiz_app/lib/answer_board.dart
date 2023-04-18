import 'package:flutter/material.dart';

import 'package:quiz_app/score_title.dart';
import 'package:quiz_app/score.dart';
import 'package:quiz_app/reset.dart';

class AnswerBoard extends StatelessWidget {
  const AnswerBoard({
    super.key,
    required this.finalScore,
    required this.handleReset,
  });

  final int finalScore;
  final VoidCallback handleReset;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ScoreTitle(),
          Score(finalScore: finalScore),
          Reset(handleReset: handleReset),
        ],
      ),
    );
  }
}
