import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/home_page.dart';
import 'package:bmi_calculator/widgets/results_card.dart';
import 'package:bmi_calculator/widgets/action_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String longText;
  const ResultsPage({
    super.key,
    required this.bmi,
    required this.result,
    required this.longText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(
          child: Text(
            'BMI Calculator',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            ResultsCard(
              bmi: bmi,
              result: result,
              longText: longText,
            ),
            ActionButton(
              title: 'RE-CALCULATE YOUR BMI',
              action: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const HomePage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
