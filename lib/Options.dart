import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String option;
  final bool isSelected;
  final bool isCorrect;

  const Options({
    super.key,
    required this.option,
    this.isSelected = false,
    this.isCorrect = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected
            ? (isCorrect ? Colors.green : Colors.red)
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        option,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}