import 'package:bmi/widgets/input_box_widget.dart';
import 'package:flutter/material.dart';

class BmiCalcWidget extends StatefulWidget {
  const BmiCalcWidget({required this.height,required this.weight,super.key});
  final double height;
  final double weight;

  @override
  State<BmiCalcWidget> createState() => _BmiCalcWidgetState();
}

class _BmiCalcWidgetState extends State<BmiCalcWidget> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(context) {
    final layoutHeight = widget.height;
    final layoutWidth = widget.weight;

    return Card(
      elevation: 12,
      color: Colors.white,
      child: Column(
        children: [
           SizedBox(height: layoutHeight * 0.05,),

           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: layoutHeight * 0.08,width: layoutWidth * 0.3,child: Text('Height in meters',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: layoutWidth * 0.05,))),
                    SizedBox(height: layoutWidth * 0.05),
                    SizedBox(
                      width: layoutWidth * 0.25,

                      child: TextField(
                        style: TextStyle(fontSize: widget.weight * 0.1),
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        decoration: InputDecoration(
                          
                          border: OutlineInputBorder(),
                          label: Text('Height'),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(width: layoutWidth * 0.02),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: layoutHeight * 0.08,width: layoutWidth * 0.2,child: Text('Weight in kgs',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: layoutWidth * 0.05,),)),
                    SizedBox(height: layoutWidth * 0.05),

                    SizedBox(
                      width: layoutWidth * 0.25,

                      child: TextField(
                        style: TextStyle(fontSize: widget.weight * 0.1),

                        keyboardType: TextInputType.number,
                        controller: weightController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Weight'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
          
          InputBoxWidget(
            width: widget.weight,
            heightController: heightController,
            weightController: weightController,
          ),
          //  SizedBox(height: layoutHeight * 0.02,),

        ],
      ),
    );
  }
}
