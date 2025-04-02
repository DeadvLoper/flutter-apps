import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qoutes/data/qoutes.dart';
import 'package:qoutes/model/qoute_model.dart';
import 'package:qoutes/service/save_to_local.dart';
import 'package:qoutes/widget/add_qoute_widget.dart';

import 'package:qoutes/widget/list_of_qoutes.dart';
import 'package:qoutes/widget/top_cat_box.dart';

final kColorSchemeLight = ColorScheme.fromSeed(seedColor: Colors.white);

Random random = Random();
LocalStorage localStorage = LocalStorage();

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  bool isPressedFb = false;
  bool isPressedTg = false;
  bool isPressedX = false;
  bool isPressedInsta = false;
  bool isPressedYt = false;
  Color color = Colors.white;
  List<QouteModel> qoutesToget = [];
  List<QouteModel> currentQoutes = [];

  void getQoutes() async {
    qoutesToget = await localStorage.getFromLocalStorage();

    setCurrentQoutes();
  }

  void setCurrentQoutes() {
    setState(() {
      currentQoutes = qoutesToget;
    });
  }

  void saveQoutes() async {
    final qoutesToSave = qoutes;
    await localStorage.saveToLocalStorage(qoutesToSave);
  }

  void resetBorderAroundLogos() {
    setState(() {
      isPressedFb = false;
      isPressedTg = false;
      isPressedX = false;
      isPressedInsta = false;
      isPressedYt = false;
    });
  }

  void checkWhichIsPressed(String imagePath) {
    if (imagePath == 'assets/image/facebook.png') {
      setState(() {
        isPressedFb = true;
        isPressedTg = false;
        isPressedX = false;
        isPressedInsta = false;
        isPressedYt = false;
      });
    } else if (imagePath == 'assets/image/instagram.png') {
      setState(() {
        isPressedFb = false;
        isPressedTg = false;
        isPressedX = false;
        isPressedInsta = true;
        isPressedYt = false;
      });
    } else if (imagePath == 'assets/image/telegram.png') {
      setState(() {
        isPressedFb = false;
        isPressedTg = true;
        isPressedX = false;
        isPressedInsta = false;
        isPressedYt = false;
      });
    } else if (imagePath == 'assets/image/twitter.png') {
      setState(() {
        isPressedFb = false;
        isPressedTg = false;
        isPressedX = true;
        isPressedInsta = false;
        isPressedYt = false;
      });
    } else if (imagePath == 'assets/image/youtube.png') {
      setState(() {
        isPressedFb = false;
        isPressedTg = false;
        isPressedX = false;
        isPressedInsta = false;
        isPressedYt = true;
      });
    }
  }

  @override
  void initState() {
    saveQoutes();
    getQoutes();

    super.initState();
    setState(() {});
  }

  void _showFbQoutes() => setState(() {
    currentQoutes =
        qoutesToget.where((qoute) => qoute.category == Category.fb).toList();
  });
  void _showTgQoutes() => setState(() {
    currentQoutes =
        qoutesToget.where((qoute) => qoute.category == Category.tg).toList();
  });
  void _showYtQoutes() => setState(() {
    currentQoutes =
        qoutesToget.where((qoute) => qoute.category == Category.yt).toList();
  });
  void _showXQoutes() => setState(() {
    currentQoutes =
        qoutesToget.where((qoute) => qoute.category == Category.x).toList();
  });
  void _showInstaQoutes() => setState(() {
    currentQoutes =
        qoutesToget.where((qoute) => qoute.category == Category.insta).toList();
  });

  void _showAddQouteOverlay(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            'ADD A QOUTE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Boldonse',
              fontSize: height * 0.02,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          content: AddQouteWidget(
            isDarkMode: isDarkMode,
            addQoute: _addQouteTolist,
            saveQoutesToLocalStorage: saveQoutes,
            getQoutesFromLocalStorage: getQoutes,
            removeQoute: _removeQouteTolist,
            resfreshUi: _refresh,
          ),
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        );
      },
    );
  }

  void _addQouteTolist(QouteModel qoute) {
    setState(() {
      qoutes.add(qoute);
    });
  }

  void _removeQouteTolist(QouteModel qoute) {
    setState(() {
      qoutes.remove(qoute);
    });
  }

  void _refresh() {
    getQoutes();

    setState(() {});
  }

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: (isDarkMode ? Colors.black : Colors.white),
        appBar: AppBar(
          backgroundColor: (isDarkMode ? Colors.black : Colors.white),
          title: Text(
            'Qoutes.inc',
            style: TextStyle(
              color: (isDarkMode ? Colors.white : Colors.black),
              fontFamily: 'Boldonse',
              fontStyle: FontStyle.normal,
            ),
          ),
          actions: [
            (isDarkMode
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      isDarkMode = false;
                    });
                  },
                  icon: Icon(
                    Icons.light_mode,
                    size: height * 0.04,
                    color: Colors.white,
                  ),
                )
                : IconButton(
                  onPressed: () {
                    setState(() {
                      isDarkMode = true;
                    });
                  },
                  icon: Icon(
                    Icons.dark_mode,
                    size: height * 0.04,
                    color: Colors.black,
                  ),
                )),
          ],
        ),
        body:
           currentQoutes.isEmpty
                ? Center(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.01),

                      Align(
                        alignment: Alignment.topCenter,
                        child: TopQouteBox(
                          isDarkMode: isDarkMode,
                          isPressedFb: isPressedFb,
                          isPressedInsta: isPressedInsta,
                          isPressedTg: isPressedTg,
                          isPressedX: isPressedX,
                          isPressedYt: isPressedYt,
                          qoutes: qoutesToget,
                          showBorderAroundLogo: checkWhichIsPressed,
                          loadFacebookPosts: _showFbQoutes, 
                          loadInstagramPosts: _showInstaQoutes,
                          loadTelegramPosts: _showTgQoutes,
                          loadXPosts: _showXQoutes,
                          loadYoutubePosts: _showYtQoutes,
                        ),
                      ),
                      SizedBox(height: height * 0.2),

                     
                            SizedBox(
                              width: height * 0.3,
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'No Qoutes Found. Add more by pressing the',
                                      style: TextStyle(
                                        color:
                                            isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.015,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' "+" ',
                                      style: TextStyle(
                                        color:
                                            isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.025,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'button.',
                                      style: TextStyle(
                                        color:
                                            isDarkMode
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.015,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      
                    
                  
                )
                : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.01),

                    Align(
                      alignment: Alignment.topCenter,
                      child: TopQouteBox(
                        isDarkMode: isDarkMode,
                        isPressedFb: isPressedFb,
                        isPressedInsta: isPressedInsta,
                        isPressedTg: isPressedTg,
                        isPressedX: isPressedX,
                        isPressedYt: isPressedYt,
                        qoutes: qoutesToget,
                        showBorderAroundLogo: checkWhichIsPressed,
                        loadFacebookPosts: _showFbQoutes,
                        loadInstagramPosts: _showInstaQoutes,
                        loadTelegramPosts: _showTgQoutes,
                        loadXPosts: _showXQoutes,
                        loadYoutubePosts: _showYtQoutes,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Flexible(
                      child: ListOfQoutes(
                        isDarkMode: isDarkMode,
                        qoutes: currentQoutes,
                        refreshUi: _refresh,
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: height * 0.05,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              currentQoutes = qoutesToget;
                            });
                            resetBorderAroundLogos();
                          },
                          child: Text(
                            'Show All',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: (isDarkMode ? Colors.white : Colors.black),

          onPressed: () {
            _showAddQouteOverlay(context);
          },
          child: Icon(
            Icons.add,
            color: (isDarkMode ? Colors.black : Colors.white),
          ),
        ),
      ),
    );
  }
}
