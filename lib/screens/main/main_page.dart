import 'package:flutter/material.dart';
import 'package:starwars/screens/home/home.dart';
import 'package:starwars/screens/top_author/top_author.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> widgetList = <Widget>[
    MyHome(), 
    TopAuthor()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home, 
            color: Colors.green
            )
          ),
          BottomNavigationBarItem(
            label: "Author",
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
      body:widgetList.elementAt(_selectedIndex)
    );
  }
}
