import 'package:flutter/material.dart';

void main() {
  runApp(const RollDice());
}

class RollDice extends StatelessWidget {
  const RollDice({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Roll Dice', home: RollDicePage());
  }
}

class RollDicePage extends StatefulWidget {
  const RollDicePage({super.key});

  @override
  State<StatefulWidget> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roll Dice'),
      ),
      body: const Text('aaa'),
    );
  }
}
