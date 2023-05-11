import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/contants.dart';

class GenderSelection extends StatelessWidget {
  final Gender type;
  final Gender gender;
  final double appBarHeight;
  final Function selectGender;
  const GenderSelection({
    super.key,
    required this.type,
    required this.gender,
    required this.appBarHeight,
    required this.selectGender,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final boxHeight = (mediaQuery.size.height - appBarHeight) * 0.276;
    final Widget icon = Icon(
      type == Gender.male ? Icons.male : Icons.female,
      size: 50,
    );
    final Widget text = Text(type == Gender.male ? 'MALE' : 'FEMALE');

    return Expanded(
      child: Padding(
        padding: type == Gender.male
            ? const EdgeInsets.only(left: 20)
            : const EdgeInsets.only(right: 20),
        child: Ink(
          height: boxHeight * 0.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: type.index == gender.index
                  ? const Color.fromARGB(255, 61, 62, 74)
                  : const Color.fromRGBO(29, 31, 51, 1)),
          child: InkWell(
            splashColor: const Color.fromRGBO(29, 31, 51, 0.8),
            borderRadius: BorderRadius.circular(10),
            onTap: () => selectGender(type),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  height: 5,
                ),
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
