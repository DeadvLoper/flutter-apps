import 'package:calculator/widget/calculator_scr.dart';
import 'package:calculator/widget/key_pad.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/service/number.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = '';
  String answer = '';

  void _userInput(String value) => setState(() {
    userInput += value;
  });
  void _clearScreen() => setState(() {
    userInput = '';
    answer = '';
  });
  void _calculate() {
    final containsNumber = userInput.contains(RegExp(r'[0-9]'));
    final endsWith = NumberA().endsWithNumber(userInput);
   if(userInput.isNotEmpty && containsNumber && endsWith){
     String _userInput = userInput;
    _userInput = _userInput.replaceAll('x', '*');
    GrammarParser p = GrammarParser();
    Expression exp = p.parse(_userInput);
    ContextModel cm = ContextModel();
    double result = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      userInput = '';
      answer = result.toString();
    });
   }
  }

  void _deleteLastOne() => setState(() {
   if(userInput.isNotEmpty){
     userInput = userInput.substring(0, userInput.length - 1);
   }
   
  });

  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CalculatorScr(value: userInput, answer: answer),
            Divider(),

            Expanded(
              flex: 3,
              child: KeyPad(
                onPressed: _userInput,
                clearScreen: _clearScreen,
                calculate: _calculate,
                deleteLastOne: _deleteLastOne,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
