import 'package:flutter/material.dart';

class CustomOnboarding extends StatelessWidget {
  final String imgSrc, onboardingTitle, descriptionOnboarding;

  const CustomOnboarding(
    this.imgSrc,
    this.onboardingTitle,
    this.descriptionOnboarding, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            // margin: EdgeInsets.only(top: 10),
            width: 442,
            height: 110,
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.52, -0.63),
                end: Alignment(1.49, 1.65),
                colors: [const Color(0xFF00FF83), Colors.white],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Image.asset(width: 250, height: 250, imgSrc),
          SizedBox(height: 100),
          Column(
            children: [
              // Text("Onboarding 1 "),
              Text(
                onboardingTitle,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                // style: TextStyl,
              ),
              SizedBox(height: 100),
              Text(
                descriptionOnboarding,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
