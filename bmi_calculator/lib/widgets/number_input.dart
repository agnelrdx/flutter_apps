import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/contants.dart';

class NumberInput extends StatelessWidget {
  final NumberSelection type;
  final int value;
  final double appBarHeight;
  final Function setter;
  const NumberInput({
    super.key,
    required this.type,
    required this.value,
    required this.appBarHeight,
    required this.setter,
  });

  @override
  Widget build(BuildContext context) {
    final Widget text = Text(type == NumberSelection.weight ? 'WEIGHT' : 'AGE');
    final mediaQuery = MediaQuery.of(context);
    final boxHeight = (mediaQuery.size.height - appBarHeight) * 0.276;
    final width = mediaQuery.size.width;

    return Expanded(
      child: Padding(
        padding: type == NumberSelection.weight
            ? const EdgeInsets.only(left: 20)
            : const EdgeInsets.only(right: 20),
        child: Ink(
          height: boxHeight + 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(29, 31, 51, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text,
              const SizedBox(
                height: 5,
              ),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: width * 0.1,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      final setValue = value - 1;
                      setter(setValue);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(13),
                      backgroundColor:
                          const Color.fromRGBO(255, 255, 255, 0.205),
                    ),
                    child: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final setValue = value + 1;
                      setter(setValue);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(13),
                      backgroundColor:
                          const Color.fromRGBO(255, 255, 255, 0.205),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
