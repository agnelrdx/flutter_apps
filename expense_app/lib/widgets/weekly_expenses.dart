import 'package:flutter/material.dart';

import './chart_bar.dart';

class WeeklyExpenses extends StatelessWidget {
  const WeeklyExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
          ChartBar(),
        ],
      ),
    );
  }
}
