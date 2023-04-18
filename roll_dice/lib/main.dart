import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:math';
import 'dart:async';

final random = Random();
final player = AudioPlayer();

void main() {
  runApp(const RollDice());
}

class RollDice extends StatelessWidget {
  const RollDice({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll Dice',
      home: const RollDicePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}

class RollDicePage extends StatefulWidget {
  const RollDicePage({super.key});

  @override
  State<StatefulWidget> createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDicePage> {
  int diceState = 1;
  int counter = 1;
  double angle = 0;
  List<String> images = [
    'assets/images/dice-1.png',
    'assets/images/dice-2.png',
    'assets/images/dice-3.png',
    'assets/images/dice-4.png',
    'assets/images/dice-5.png',
    'assets/images/dice-6.png',
  ];

  rollDice() async {
    await player.setAsset('assets/audio/rolling-dice.mp3');
    player.play();

    Timer.periodic(const Duration(milliseconds: 80), (timer) {
      counter++;
      angle = random.nextDouble() * 180;
      setState(() {
        diceState = random.nextInt(6);
      });

      if (counter >= 15) {
        timer.cancel();

        counter = 1;
        angle = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Roll Dice'),
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.rotate(
              angle: angle, // random.nextDouble() * 180,
              child: Image.asset(
                images[diceState],
                height: 100,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(10),
                backgroundColor: Colors.white,
                foregroundColor: Colors.deepPurple,
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
              ),
              child: const Text('Roll Dice'),
            )
          ],
        ),
      ),
    );
  }
}
