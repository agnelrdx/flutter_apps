import 'package:flutter/material.dart';

import 'package:quiz_app/question_board.dart';
import 'package:quiz_app/answer_board.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Quiz Demo',
      home: _QuizAppPage(title: 'Quiz APP'),
    );
  }
}

class _QuizAppPage extends StatefulWidget {
  final String title;

  const _QuizAppPage({required this.title});

  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<_QuizAppPage> {
  final _questions = const [
    {
      'title': 'What country has the highest life expectancy?',
      'choices': ['Hong Kong', 'Delhi', 'Dubai', 'Newyork'],
      'answer': 'Hong Kong',
    },
    {
      'title': 'What year was the United Nations established?',
      'choices': ['1987', '1929', '1945', '2001'],
      'answer': '1945',
    },
    {
      'title': 'What company was originally called "Cadabra"?',
      'choices': ['Google', 'Amazon', 'Facebook', 'Tesla'],
      'answer': 'Amazon',
    },
    {
      'title': 'Which planet in the Milky Way is the hottest?',
      'choices': ['Venus', 'Mercury', 'Earth', 'Mars'],
      'answer': 'Venus',
    },
    {
      'title': 'How many elements are in the periodic table?',
      'choices': ['112', '115', '117', '118'],
      'answer': '118',
    }
  ];
  int _questionIndex = 0;
  int _score = 0;

  void _handlePress(String choice) {
    if (choice == _questions[_questionIndex]['answer']) {
      _score = _score + 10;
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _handleReset() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? QuestionBoard(
                questions: _questions,
                questionIndex: _questionIndex,
                handlePress: (choice) => _handlePress(choice),
              )
            : AnswerBoard(
                finalScore: _score,
                handleReset: _handleReset,
              ),
      ),
    );
  }
}
