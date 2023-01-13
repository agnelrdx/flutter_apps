import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final String day;
  final double totalAmount;
  const ChartBar({
    super.key,
    required this.amount,
    required this.day,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final amountTruncated = '$amount'.length > 5
        ? '${amount.toString().substring(0, 4)}...'
        : amount;

    return Flexible(
      fit: FlexFit.tight,
      child: Column(
        children: [
          FittedBox(
            child: Text(isLandscape ? '\$$amount' : '\$$amountTruncated'),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 10,
            height: !isLandscape ? 70 : 40,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 195, 194, 194),
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: totalAmount,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(day),
        ],
      ),
    );
  }
}
