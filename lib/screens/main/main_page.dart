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

  List<Widget> widgetList = <Widget>[MyHome(),NewsNotification()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: "Health",
            icon: Icon(Icons.health_and_safety, color: Colors.green),
          ),
          BottomNavigationBarItem(
            label: "Everything News",
            icon: Icon(
              Icons.topic,
              color: const Color.fromARGB(255, 91, 165, 144),
            ),
          ),
        ],

        //set state change when index is active while clicked
        onTap: (idx) {
          setState(() {
            _selectedIndex = idx;
          });
        },
      ),
      body: widgetList.elementAt(_selectedIndex),
    );
  }
}
