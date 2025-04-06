import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({required this.result, required this.width,super.key});
  final String result;
  final double width;

  (Color, String) getColor() {
    double resultNumber = double.parse(result);
    if (resultNumber < 18.5) {
      return (Colors.yellow, 'You are underweight');
    } else if (resultNumber <= 24.9 && resultNumber >= 18.5) {
      return (Colors.green, 'You are fit');
    } else if (resultNumber >= 25 && resultNumber <= 29.9) {
      return (Colors.deepOrange, 'You are overweight');
    } else if (resultNumber >= 30) {
      return (Colors.red , 'You are obese');
    }
    return (Colors.white , '');
  }

  @override
  Widget build(context) {
    final fontSize = MediaQuery.of(context).size.width * 0.06;
    final color  = getColor().$1;
    final message = getColor().$2;

    return Container(
      width: width,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'BMI\n $result',
              style: TextStyle(
                color: (color == Colors.yellow ? Colors.blueGrey : Colors.white),
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
              message,
              style: TextStyle(
                color: (color == Colors.yellow ? Colors.blueGrey : Colors.white),
                fontSize: fontSize * 0.8,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
