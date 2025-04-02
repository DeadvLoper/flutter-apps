import 'package:flutter/material.dart';
import 'package:qoutes/model/qoute_model.dart';
import 'package:qoutes/widget/qoute_box.dart';

class ListOfQoutes extends StatelessWidget {
  const ListOfQoutes({
    super.key,
    required this.qoutes,
    required this.refreshUi,
    required this.isDarkMode,
  });
  final List<QouteModel> qoutes;
  final void Function() refreshUi;
  final bool isDarkMode;

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height * 0.6;
    final width = MediaQuery.of(context).size.width * 0.8;
    Color color = (isDarkMode ? Colors.white : Colors.black);

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(height * 0.02),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border(
            top: BorderSide(style: BorderStyle.solid, width: height * 0.005,color: color),
            right: BorderSide(style: BorderStyle.solid, width: height * 0.005,color: color),
            left: BorderSide(style: BorderStyle.solid, width: height * 0.005,color: color),
            bottom: BorderSide(style: BorderStyle.solid, width: height * 0.005,color: color),
          ),
        ),
        child: ListView.builder(
          itemCount: qoutes.length,
          itemBuilder: (ctx, index) {
            return QouteBox(isDarkMode: isDarkMode,qoute: qoutes[index], refreshUi: refreshUi);
          },
        ),
      ),
    );
  }
}
