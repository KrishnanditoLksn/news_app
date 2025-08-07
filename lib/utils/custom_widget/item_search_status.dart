import 'package:flutter/material.dart';

class ItemSearchStatus extends StatelessWidget {
  final String srcImg;
  final String title;

  const ItemSearchStatus(this.srcImg, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(50.0),
        child: Column(
          children: [
            Image.asset(srcImg, height: 200, width: 200),
            SizedBox(height: 200),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
