import 'package:flutter/material.dart';

class LoadButton extends StatelessWidget {
  const LoadButton({
    required this.imagePath,
    required this.onTap,
    required this.numberOfQoutes,
    super.key,
    required this.width,
    required this.animationPress,
    required this.padding,
    required this.isDarkMode,
  });
  final String imagePath;
  final void Function() onTap;
  final int numberOfQoutes;
  final double width;
  final void Function(String imagePath) animationPress;
  final double padding;
  final bool isDarkMode;

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () {
        onTap();
        animationPress(imagePath);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDarkMode ?  padding == 5 ? Colors.white : Colors.grey[900] : padding == 5 ? Colors.black : Colors.white ,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath)),
              ),
              child: Padding(padding: EdgeInsets.all(width * 0.05)),
            ),
          ),
          SizedBox(height: width * 0.01),
          Text(
            (numberOfQoutes == 0 ? '.' : '$numberOfQoutes'),
            style: TextStyle(
              fontSize: width * 0.05,
              color: isDarkMode ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
