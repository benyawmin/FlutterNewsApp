import 'package:flutter/material.dart';
import '../src/screens/home_screen.dart';
import '../src/blocs/latest_news_provider.dart';

class App extends StatelessWidget {
  Widget build(BuildContext build) {
    return LatestNewsProvider(
        child: MaterialApp(
      title: 'News',
      theme: ThemeData(
        primaryColor: Colors.white
      ),
      home: HomeScreen(),
    ));
  }
}
