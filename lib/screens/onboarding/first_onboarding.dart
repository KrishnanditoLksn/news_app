import 'package:flutter/material.dart';
import 'package:starwars/utils/custom_widget/custom_onboarding.dart';

class FirstOnboarding extends StatelessWidget {
  const FirstOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomOnboarding(
        "./assets/images/onboard1.png",
        "Hello",
        "Lorem Ipsum",
      ),
    );
  }
}
