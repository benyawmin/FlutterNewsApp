import 'package:flutter/material.dart';
import 'package:news/src/screens/categories.dart';
import 'package:news/src/screens/home.dart';
import 'Search.dart';
import 'area.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  createState() {
    return new HomeScreenState();
  }
}

@override
class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Area(),
    Profile(),
    Categories(),
    SingleChildScrollView(
      child: Search(),
    ),
    Home(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          width: 20,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.map_outlined),
                  label: 'Areas',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.featured_play_list),
                  label: 'Feature',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onTapItem,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
            ),
          ),
        ));
  }
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
