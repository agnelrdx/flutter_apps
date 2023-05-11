import 'package:flutter/material.dart';

class ResultsCard extends StatelessWidget {
  final String bmi;
  final String result;
  final String longText;
  const ResultsCard({
    super.key,
    required this.bmi,
    required this.result,
    required this.longText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(29, 31, 51, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              result,
              style: const TextStyle(
                color: Color.fromRGBO(47, 217, 128, 1),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              bmi,
              style: const TextStyle(
                fontSize: 100,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: Text(
                longText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
