import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    required this.number,
    required this.buttonColor,
    required this.textColor,
    required this.onPressed,
    super.key,
  });
  final String number;
  final void Function() onPressed;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black), BoxShadow(color:  Colors.black26,)],
              color: buttonColor,
            ),

            child: Center(
              child: Text(number, style: TextStyle(color: textColor,fontWeight: FontWeight.bold,fontSize: 22,)),
            ),
          ),
        ),
      ),
    );
  }
}
