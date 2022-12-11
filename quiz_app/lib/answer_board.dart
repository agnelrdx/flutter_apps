import 'package:flutter/material.dart';

import './score_title.dart';
import './score.dart';
import './reset.dart';

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
