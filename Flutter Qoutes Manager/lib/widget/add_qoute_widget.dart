import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qoutes/model/qoute_model.dart';
import 'package:qoutes/service/local_files.dart';

class AddQouteWidget extends StatefulWidget {
  const AddQouteWidget({
    super.key,
    required this.addQoute,
    required this.saveQoutesToLocalStorage,
    required this.getQoutesFromLocalStorage,
    required this.removeQoute,
    required this.resfreshUi,
    required this.isDarkMode,
  });
  final void Function() saveQoutesToLocalStorage;
  final void Function() getQoutesFromLocalStorage;
  final void Function(QouteModel qoute) addQoute;
  final void Function(QouteModel qoute) removeQoute;
  final void Function() resfreshUi;
  final bool isDarkMode;

  @override
  State<AddQouteWidget> createState() => _AddQouteWidgetState();
}

class _AddQouteWidgetState extends State<AddQouteWidget> {
  final TextEditingController _qoute = TextEditingController();
  final TextEditingController _author = TextEditingController();
  String? imagePath;
  DateTime? date;
  Category? category;

  void _showDatePickerOverlay() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((datec) {
      setState(() {
        date = datec;
      });
    });
  }

  void _verifySubmittion() {
    final width = MediaQuery.of(context).size.width;

    if (_qoute.text.trim().isEmpty ||
        _author.text.trim().isEmpty ||
        imagePath == null ||
        date == null) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Icon(Icons.error, size: width * 0.2, color: Colors.red),
            content: SizedBox(
              width: width * 0.5,
              child: Text(
                'Please ensure that no fields are left empty!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: width * 0.05),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Okay', style: TextStyle(fontSize: width * 0.05)),
              ),
            ],
          );
        },
      );
      return;
    }

    widget.addQoute(
      QouteModel(
        qoute: _qoute.text,
        author: _author.text,
        date: date!,
        imagePath: imagePath!,
        category: category!,
      ),
    );

    widget.saveQoutesToLocalStorage();
    widget.getQoutesFromLocalStorage();
    widget.resfreshUi();
    widget.removeQoute(
      QouteModel(
        qoute: _qoute.text,
        author: _author.text,
        date: date!,
        imagePath: imagePath!,
        category: category!,
      ),
    );
    Navigator.pop(context);
  }

  String? _getImage(Category category) {
    if (category == Category.fb) {
      return 'assets/image/facebook.png';
    } else if (category == Category.insta) {
      return 'assets/image/instagram.png';
    } else if (category == Category.tg) {
      return 'assets/image/telegram.png';
    } else if (category == Category.x) {
      return 'assets/image/twitter.png';
    } else if (category == Category.yt) {
      return 'assets/image/youtube.png';
    }
    return null;
  }

  Color? _getColor(Category category) {
    if (category == Category.fb) {
      return Colors.blue;
    } else if (category == Category.insta) {
      return Colors.purpleAccent;
    } else if (category == Category.tg) {
      return Colors.blueAccent;
    } else if (category == Category.x) {
      return Colors.black;
    } else if (category == Category.yt) {
      return Colors.red;
    }
    return null;
  }

  String? _getFullName(Category category) {
    if (category == Category.fb) {
      return 'Facebook';
    } else if (category == Category.insta) {
      return 'Instagram';
    } else if (category == Category.tg) {
      return 'Telegram';
    } else if (category == Category.x) {
      return 'Twitter';
    } else if (category == Category.yt) {
      return 'Youtube';
    }
    return null;
  }

  @override
  void dispose() {
    _qoute.dispose();
    _author.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: SizedBox(
        width: width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _qoute,
              decoration: InputDecoration(
                label: Text(
                  'Qoute',
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                icon: Icon(
                  Icons.quora_outlined,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _author,
              decoration: InputDecoration(
                label: Text(
                  'Author',
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),

                icon: Icon(
                  Icons.person_2,
                  color: widget.isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              child: Column(
                children: [
                  (category == null
                      ? DropdownButton(
                        dropdownColor:
                            widget.isDarkMode ? Colors.black : Colors.white,
                        icon: Icon(
                          Icons.category,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                        hint: Text(
                          'Select Platform',
                          style: TextStyle(
                            color:
                                widget.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        // value: category,
                        items:
                            Category.values.map((category) {
                              return DropdownMenuItem(
                                value: category,

                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(_getImage(category)!),
                                      height: width * 0.06,
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Text(
                                      _getFullName(category)!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color:
                                            widget.isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            category = value;
                          });
                        },
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Found on',
                            style: TextStyle(
                              color:
                                  widget.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: width * 0.05),

                          Image.asset(
                            _getImage(category!)!,
                            height: width * 0.08,
                          ),
                          SizedBox(width: width * 0.05),
                          Text(
                            _getFullName(category!)!,
                            style: TextStyle(
                              color: _getColor(category!),
                              fontSize: width * 0.04,
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () async {
                      imagePath = await LocalFiles().getImage();
                      setState(() {});
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        (imagePath == null || imagePath!.isEmpty
                            ? Icon(
                              Icons.add_photo_alternate,
                              size: width * 0.08,
                              color:
                                  widget.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                            )
                            : Image.file(
                              File(imagePath!),
                              height: width * 0.1,
                            )),
                        const SizedBox(width: 10),

                        Text(
                          (imagePath == null || imagePath!.isEmpty
                              ? 'Add profile'
                              : 'Image selected'),
                          style: TextStyle(
                            color:
                               widget.isDarkMode ?   (imagePath == null
                                    ? Colors.white
                                    : Colors.green) :  (imagePath == null
                                    ? const Color.fromARGB(255, 24, 23, 23)
                                    : Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Spacer(),
                  TextButton(
                    onPressed: _showDatePickerOverlay,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.date_range,
                          size: width * 0.08,
                          color:
                              widget.isDarkMode ? Colors.white : Colors.black,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          (date == null
                              ? 'Select a date'
                              : formatter.format(date!).toString()),
                          style: TextStyle(
                            color: widget.isDarkMode ?   (date == null
                                    ? Colors.white
                                    : Colors.green) :  (date == null
                                    ? const Color.fromARGB(255, 24, 23, 23)
                                    : Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                      vertical: 6,
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Spacer(),
                FilledButton(
                  onPressed: _verifySubmittion,
                  style: FilledButton.styleFrom(
                    backgroundColor: widget.isDarkMode ? Colors.white : Colors.black,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                      vertical: 6,
                    ),
                  ),
                  child: Text('Add',style: TextStyle(color: widget.isDarkMode ? Colors.black : Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
