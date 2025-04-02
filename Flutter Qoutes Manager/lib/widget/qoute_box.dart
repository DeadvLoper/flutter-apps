import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qoutes/model/qoute_model.dart';
import 'package:qoutes/service/save_to_local.dart';

class QouteBox extends StatelessWidget {
  const QouteBox({required this.qoute, required this.refreshUi, required this.isDarkMode,super.key});
  final QouteModel qoute;
  
  final void Function() refreshUi;
  final bool isDarkMode;

  @override
  Widget build(context) {
    final localStorage = LocalStorage();

    final spaceBetweenTop = MediaQuery.of(context).size.height * 0.01;
    final spaceBetweenQoute = MediaQuery.of(context).size.height * 0.03;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      
      margin: EdgeInsets.all( width * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        boxShadow: [(isDarkMode ? BoxShadow(color: const Color.fromARGB(255, 39, 37, 37),blurRadius: 10,blurStyle: BlurStyle.outer,offset: Offset.zero,spreadRadius: 1) : BoxShadow(color: const Color.fromARGB(255, 206, 205, 205),blurRadius: 10,blurStyle: BlurStyle.outer,offset: Offset.zero,spreadRadius: 1))],
        color: (isDarkMode ? Colors.grey[900] : Colors.white),
        
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(style: BorderStyle.solid),
                    top: BorderSide(style: BorderStyle.solid),
                    left: BorderSide(style: BorderStyle.solid),
                    right: BorderSide(style: BorderStyle.solid),
                  ),

                  shape: BoxShape.circle,

                  image: DecorationImage(
                    image: FileImage(File(qoute.imagePath)),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(padding: EdgeInsets.all(width * 0.05)),
              ),
              SizedBox(width: spaceBetweenTop),
              Flexible(
                flex: 2,
                child: Text(
                  qoute.author,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.bold,
                    color: (isDarkMode ? Colors.white : Colors.black),
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.005),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(style: BorderStyle.solid),
                    top: BorderSide(style: BorderStyle.solid),
                    left: BorderSide(style: BorderStyle.solid),
                    right: BorderSide(style: BorderStyle.solid),
                  ),
                  color: (isDarkMode ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Text(
                      qoute.formattedDate.replaceAll('/', ' | '),
                      style: TextStyle(
                        fontSize: width * 0.034,
                        fontWeight: FontWeight.bold,
                        color: (isDarkMode ? Colors.black : Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: spaceBetweenQoute),
                     
          Text(qoute.qoute, style: TextStyle(fontSize: width * 0.035,color: (isDarkMode ? Colors.white : Colors.black))),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text(
                          'Are you sure? You want to delete it.',
                          style: TextStyle(fontSize: width * 0.05),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              localStorage.removeFromLocalStorage(qoute);
                              refreshUi();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'No',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete, color: Colors.red, size: width * 0.06),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
