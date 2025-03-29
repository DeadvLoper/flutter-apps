import 'package:flutter/material.dart';

class SideButtons extends StatelessWidget {
  const SideButtons({super.key});

  @override
  Widget build(context) {
    final height = MediaQuery.of(context).size.height * 0.4;
    final width = MediaQuery.of(context).size.height * 0.08;

    return Container(
      margin: EdgeInsets.only(right: 10, bottom: 10),
      child: SizedBox(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(width * 0.2),
                ),
                onPressed: () {},
                child: Text(
                  '+',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(width * 0.2),
                ),

                onPressed: () {},
                child: Text(
                  '-',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(width * 0.2),
                ),

                onPressed: () {},
                child: Text(
                  '*',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(width * 0.2),
                ),

                onPressed: () {},
                child: Text(
                  '/',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
