import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final Function action;
  const ActionButton({super.key, required this.title, required this.action});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(235, 20, 85, 1),
      ),
      child: InkWell(
        onTap: () => action(),
        splashColor: const Color.fromARGB(255, 122, 11, 44),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
