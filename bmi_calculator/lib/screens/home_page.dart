import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/contants.dart';
import 'package:bmi_calculator/widgets/gender_selection.dart';
import 'package:bmi_calculator/widgets/height_selection.dart';
import 'package:bmi_calculator/widgets/number_input.dart';
import 'package:bmi_calculator/widgets/action_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/utils/bmi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _BmiAppState();
}

class _BmiAppState extends State<HomePage> {
  Gender gender = Gender.male;
  double height = 160;
  int weight = 30;
  int age = 20;

  void _selectGender(Gender setGender) {
    setState(() {
      gender = setGender;
    });
  }

  void _selectHeight(double setHeight) {
    setState(() {
      height = setHeight;
    });
  }

  void _selectWeight(int setWeight) {
    setState(() {
      weight = setWeight;
    });
  }

  void _selectAge(int setAge) {
    setState(() {
      age = setAge;
    });
  }

  @override
  Widget build(BuildContext context) {
    final PreferredSizeWidget appBar = AppBar(
      elevation: 10,
      backgroundColor: const Color(0xFF0A0E21),
      title: const Center(
        child: Text(
          'BMI Calculator',
        ),
      ),
    );
    final double appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GenderSelection(
                type: Gender.male,
                gender: gender,
                appBarHeight: appBarHeight,
                selectGender: _selectGender,
              ),
              const SizedBox(width: 10),
              GenderSelection(
                type: Gender.female,
                gender: gender,
                appBarHeight: appBarHeight,
                selectGender: _selectGender,
              ),
            ],
          ),
          HeightSelection(
            height: height,
            appBarHeight: appBarHeight,
            selectHeight: _selectHeight,
          ),
          Row(
            children: [
              NumberInput(
                type: NumberSelection.weight,
                value: weight,
                appBarHeight: appBarHeight,
                setter: _selectWeight,
              ),
              const SizedBox(width: 10),
              NumberInput(
                type: NumberSelection.age,
                value: age,
                appBarHeight: appBarHeight,
                setter: _selectAge,
              ),
            ],
          ),
          const SizedBox(height: 20),
          ActionButton(
            title: 'CALCULATE YOUR BMI',
            action: () {
              final Bmi bmiObj = Bmi(height: height, weight: weight);
              final String bmi = bmiObj.calculateBMI();
              final String result = bmiObj.getResult();
              final String longText = bmiObj.getInterpretation();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: bmi,
                    result: result,
                    longText: longText,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
