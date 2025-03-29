import 'package:flutter/material.dart';

class CalculatorScr extends StatefulWidget {
  const CalculatorScr({required this.answer,required this.value, super.key});
  final String value;
  final String answer;

  @override
  State<CalculatorScr> createState() => _CalculatorScrState();
}

class _CalculatorScrState extends State<CalculatorScr> {
  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.redAccent,
      height: 200,
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.value,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
              ),

               Text(
                widget.answer,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
