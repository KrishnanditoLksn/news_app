import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:starwars/screens/home/home.dart';
import 'package:starwars/screens/notification/news_notification.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late PageController _pageController;

  List<Widget> widgetList = <Widget>[MyHome(), NewsNotification()];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged:
              (value) => {
                setState(() {
                  _selectedIndex = value;
                }),
              },
          children: [MyHome(), NewsNotification()],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        showElevation: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: _selectedIndex,
        onItemSelected:
            (index) => setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            }),
        items: [
          BottomNavyBarItem(
            activeColor: Colors.green,
            title: Text("News", style: TextStyle(fontFamily: "Poppins")),
            icon: Icon(
              Icons.newspaper,
              color: const Color.fromARGB(255, 71, 16, 2),
            ),
          ),
          BottomNavyBarItem(
            title: Text("Settings", style: TextStyle(fontFamily: "Poppins")),
            icon: Icon(
              Icons.settings,
              color: const Color.fromARGB(255, 1, 25, 18),
            ),
          ),
        ],
      ),
    );
  }
}
