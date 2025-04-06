import 'package:bmi/widgets/result_widget.dart';
import 'package:flutter/material.dart';

class InputBoxWidget extends StatefulWidget {
  const InputBoxWidget({
    required this.heightController,
    required this.weightController,
    required this.width,
    super.key,
  });
  final TextEditingController weightController;
  final TextEditingController heightController;
  final double width;

  @override
  State<InputBoxWidget> createState() => _InputBoxWidgetState();
}

class _InputBoxWidgetState extends State<InputBoxWidget> {
  String result = '';
  @override
  Widget build(context) {
    return Column(
      children: [
        if (result.isNotEmpty) ResultWidget(width: widget.width,result: result),
        SizedBox(
          width: widget.width,
          child: FilledButton(
            style: FilledButton.styleFrom(
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),)),
              backgroundColor: Colors.indigoAccent,
              padding: EdgeInsets.symmetric(
                horizontal: widget.width * 0.25,
                vertical: widget.width * 0.05,
              ),
            ),
            onPressed: () {
              if (widget.weightController.text.isNotEmpty &&
                  widget.heightController.text.isNotEmpty) {
                setState(() {
                  result = (double.parse(widget.weightController.text) /
                          (double.parse(widget.heightController.text) *
                              double.parse(widget.heightController.text)))
                      .toStringAsFixed(0);
                  widget.heightController.clear();
                  widget.weightController.clear();
                });
              }
            },
            child: Text('Calculate'),
          ),
        ),
      ],
    );
  }
}
