class Onboarding {
  String? image;
  String? desc;
  String? title;

  Onboarding({required this.image, required this.title, required this.desc});
}

List<Onboarding> onboardingList = [
  Onboarding(
    image: "./assets/images/onboard1.png",
    desc: "Welcome to JobTree.An app for whatever you want, whenever you want!",
    title: "A",
  ),
  Onboarding(
    image: "./assets/images/onboard2.png",
    desc: "Welcome to JobTree.An app for whatever you want, whenever you want!",
    title: "A",
  ),
  Onboarding(
    image: "./assets/images/onboard3.png",
    desc: "Welcome to JobTree.An app for whatever you want, whenever you want!",
    title: "A",
  ),
];
