import 'package:flutter/material.dart';
import 'package:starwars/screens/onboarding/first_onboarding.dart';
import 'package:starwars/screens/onboarding/second_onboarding.dart';
import 'package:starwars/utils/custom_widget/button_indicator_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return OnboardingState();
  }
}

class OnboardingState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    _pageController = PageController();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageController,
          onPageChanged: _handlePageViewChanged,
          children: <Widget>[FirstOnboarding(), SecondOnboarding()],
        ),
        ButtonIndicatorOnboarding(
          _currentPageIndex,
          _tabController,
          _updatePageViewChanged,
        ),
      ],
    );
  }

  void _handlePageViewChanged(int currPageIdx) {
    _tabController.index = currPageIdx;
    setState(() {
      _currentPageIndex = currPageIdx;
    });
  }

  void _updatePageViewChanged(int idx) {
    _tabController.index = idx;
    _pageController.animateToPage(
      idx,
      duration: Duration(microseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
