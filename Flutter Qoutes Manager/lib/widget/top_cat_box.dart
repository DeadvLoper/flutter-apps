import 'package:flutter/material.dart';
import 'package:qoutes/model/qoute_model.dart';
import 'package:qoutes/widget/load_button.dart';

class TopQouteBox extends StatefulWidget {
  TopQouteBox({
    super.key,
    required this.qoutes,
    required this.loadFacebookPosts,
    required this.loadInstagramPosts,
    required this.loadTelegramPosts,
    required this.loadXPosts,
    required this.loadYoutubePosts,
    required this.isPressedFb,
    required this.isPressedYt,
    required this.isPressedX,
    required this.isPressedInsta,
    required this.isPressedTg,
    required this.showBorderAroundLogo,
    required this.isDarkMode,
  });
  final void Function() loadFacebookPosts;
  final void Function() loadTelegramPosts;
  final void Function() loadYoutubePosts;
  final void Function() loadInstagramPosts;
  final void Function() loadXPosts;

  final void Function(String imagePath) showBorderAroundLogo;
  final bool isPressedFb;
  final bool isPressedTg;
  final bool isPressedX;
  final bool isPressedInsta;
  final bool isPressedYt;
  final List<QouteModel> qoutes;
  final bool isDarkMode;

  @override
  State<TopQouteBox> createState() => _TopQouteBoxState();
}

class _TopQouteBoxState extends State<TopQouteBox> {
  @override
  Widget build(context) {
    final int lengthOfTelegramQoutes =
        widget.qoutes.where((qoute) => qoute.category == Category.tg).length;
    final int lengthOfFacebookQoutes =
        widget.qoutes.where((qoute) => qoute.category == Category.fb).length;
    final int lengthOfYoutubeQoutes =
        widget.qoutes.where((qoute) => qoute.category == Category.yt).length;
    final int lengthOfInstagramQoutes =
        widget.qoutes.where((qoute) => qoute.category == Category.insta).length;
    final int lengthOfTwitterQoutes =
        widget.qoutes.where((qoute) => qoute.category == Category.x).length;

    final width = MediaQuery.of(context).size.width * 0.8;
    final height = MediaQuery.of(context).size.height * 0.18;

    final double widthOfMainContainer = width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          (widget.isDarkMode
              ? BoxShadow(
                color: const Color.fromARGB(103, 255, 255, 255),
                blurRadius: 7,
                spreadRadius: 2,
              )
              : BoxShadow(color: Colors.white, blurRadius: 2)),
        ],
        border: Border(
          bottom: BorderSide(style: BorderStyle.solid),
          top: BorderSide(style: BorderStyle.solid),
          left: BorderSide(style: BorderStyle.solid),
          right: BorderSide(style: BorderStyle.solid),
        ),

        color: (widget.isDarkMode ? Colors.grey[900] : Colors.white),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: widthOfMainContainer,
            height: width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: width * 0.05),
                Text(
                  'Qoutes added ',
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white : Colors.black,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: widthOfMainContainer * 0.5,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.qoutes.length.toString(),
                      style: TextStyle(
                        color: widget.isDarkMode ? Colors.white : Colors.black,

                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Boldonse',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(),
                child: LoadButton(
                  isDarkMode: widget.isDarkMode,
                  animationPress: widget.showBorderAroundLogo,
                  padding: widget.isPressedTg == true ? 5 : 0,
                  width: width,
                  numberOfQoutes: lengthOfTelegramQoutes,
                  imagePath: 'assets/image/telegram.png',
                  onTap: widget.loadTelegramPosts,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(),

                child: LoadButton(
                  isDarkMode: widget.isDarkMode,

                  animationPress: widget.showBorderAroundLogo,

                  padding: widget.isPressedYt == true ? 5 : 0,
                  width: width,

                  numberOfQoutes: lengthOfYoutubeQoutes,

                  imagePath: 'assets/image/youtube.png',
                  onTap: widget.loadYoutubePosts,
                ),
              ),
              DecoratedBox(
                decoration: BoxDecoration(),

                child: LoadButton(
                  isDarkMode: widget.isDarkMode,

                  animationPress: widget.showBorderAroundLogo,

                  padding: widget.isPressedX == true ? 5 : 0,

                  width: width,

                  numberOfQoutes: lengthOfTwitterQoutes,

                  imagePath: 'assets/image/twitter.png',
                  onTap: widget.loadXPosts,
                ),
              ),
              LoadButton(
                isDarkMode: widget.isDarkMode,

                animationPress: widget.showBorderAroundLogo,

                padding: widget.isPressedFb == true ? 5 : 0,

                width: width,

                numberOfQoutes: lengthOfFacebookQoutes,

                imagePath: 'assets/image/facebook.png',
                onTap: widget.loadFacebookPosts,
              ),
              LoadButton(
                isDarkMode: widget.isDarkMode,

                animationPress: widget.showBorderAroundLogo,

                padding: widget.isPressedInsta == true ? 5 : 0,

                width: width,

                numberOfQoutes: lengthOfInstagramQoutes,

                imagePath: 'assets/image/instagram.png',
                onTap: widget.loadInstagramPosts,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
