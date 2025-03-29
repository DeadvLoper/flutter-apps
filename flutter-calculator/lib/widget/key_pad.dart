import 'package:calculator/data/keys.dart';
import 'package:calculator/model/button.dart';
import 'package:flutter/material.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({super.key,required this.onPressed,required this.clearScreen,required this.calculate,required this.deleteLastOne});
  final void Function(String value) onPressed;
  final void Function() clearScreen;
  final void Function() calculate;
  final void Function() deleteLastOne;
  

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  List<String> numbers = keys;

  @override
  Widget build(context) {
   List<String> keys = [
    'C', '+/-', '%', 'DEL', '9', '8', '7', '+', '6','5','4','-','3','2','1','x','0','.','=','/',
  
  ];
    return Container(
      child: GridView.builder(itemCount: keys.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), itemBuilder: (ctx, index){
        if(index  == 0){
          return CalculatorButton(number: keys[index], buttonColor: Colors.amber, textColor: Colors.black, onPressed: (){
           widget.clearScreen();
          });
        }else if(index == 1){
          return CalculatorButton(number: keys[index], buttonColor: Colors.grey, textColor: Colors.white, onPressed: (){
          });
        }else if(index == 2){
          return CalculatorButton(number: keys[index], buttonColor: Colors.grey, textColor: Colors.white, onPressed: (){
           widget.onPressed(keys[index]);
          });
        }else if(index == 3){
          return CalculatorButton(number: keys[index], buttonColor: Colors.red, textColor: Colors.white, onPressed: (){
            widget.deleteLastOne();
          });
        }else {
          return CalculatorButton(number: keys[index], buttonColor: isOperator(keys[index]) ? Colors.blue : Colors.white, textColor: isOperator(keys[index]) ? Colors.white : Colors.black, onPressed: (){
            if(keys[index] != '='){
                        widget.onPressed(keys[index]);

            }else if(keys[index] == '='){
              widget.calculate();
            }
          });
        }
        }),
    );
      }



      bool isOperator(String operator){
        if(operator == '+' || operator == '-' || operator == '/' || operator == 'x' || operator == '='){
          return true;
        }else{
          return false;
        }
      }
  }

