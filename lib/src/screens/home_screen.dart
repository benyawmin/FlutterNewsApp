import 'package:flutter/material.dart';
import 'package:news/src/screens/categories.dart';
import 'package:news/src/screens/home.dart';

class HomeScreen extends StatefulWidget {
  createState() {
    return new HomeScreenState();
  }
}

@override
class HomeScreenState extends State<HomeScreen> {
  // final jsn = NewsApiProvider();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Areas',
      style: optionStyle,
    ),
    Text(
      'Index 1: Contact',
      style: optionStyle,
    ),
    Categories(),
    Text(
      'Index 3: Search',
      style: optionStyle,
    ),
    Home(),
    // NewsList(),
  ];

  Widget build(BuildContext context) {
      // final bloc = LatestNewsProvider.of(context);
      // print(bloc.fetchLatestNews());
    // pr();
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }

  // void pr() {
  //   ItemModel sd = jsn.fetchLatestNews();
  //   print(sd.author);
  // }

  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
