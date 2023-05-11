import 'package:flutter/material.dart';

class HeightSelection extends StatelessWidget {
  final double height;
  final double appBarHeight;
  final Function selectHeight;
  const HeightSelection({
    super.key,
    required this.height,
    required this.appBarHeight,
    required this.selectHeight,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final boxHeight = (mediaQuery.size.height - appBarHeight) * 0.276;
    final width = mediaQuery.size.width;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        height: boxHeight,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(29, 31, 51, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('HEIGHT'),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  height.toStringAsFixed(0),
                  style: TextStyle(
                    fontSize: width * 0.1,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text('cm'),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 300,
              height: 35,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  inactiveTrackColor: const Color(0xFF8D8E98),
                  activeTrackColor: Colors.white,
                  thumbColor: const Color(0xFFEB1555),
                  overlayColor: const Color(0x29EB1555),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                  trackHeight: 2,
                ),
                child: Slider(
                  value: height,
                  max: 250,
                  min: 120,
                  onChanged: (double value) => selectHeight(value),
                  thumbColor: const Color.fromRGBO(235, 20, 85, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
