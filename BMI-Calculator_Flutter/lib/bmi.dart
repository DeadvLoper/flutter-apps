import 'package:bmi/widgets/bmi_calc_widget.dart';
import 'package:flutter/material.dart';

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: width * 0.8,
          height: height * 0.5,
          child: BmiCalcWidget(weight: width, height: height),
        ),
      ),
    );
  }
}
