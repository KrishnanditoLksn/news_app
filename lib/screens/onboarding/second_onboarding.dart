import 'package:flutter/material.dart';
import 'package:starwars/utils/custom_widget/custom_onboarding.dart';

class SecondOnboarding extends StatelessWidget {
  const SecondOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnboarding(
        "./assets/images/onboard2.png",
        "Hello",
        "Lorem Ipsum",
      ),
    );
  }
}
