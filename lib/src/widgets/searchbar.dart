import 'package:flutter/material.dart';
import '../blocs/latest_news_provider.dart';

class SearchBar extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    return Container(
        width: 250,
        margin: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: TextField(
          onSubmitted: (text) => bloc.fetchSearchedNews(text),
          autocorrect: false,
          decoration: InputDecoration(
              hintStyle: TextStyle(color: hexToColor('#cecece')),
              contentPadding: EdgeInsets.all(10),
              isDense: true,
              filled: true,
              fillColor: hexToColor('#f5f5f5'),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              hintText: 'Search...'
              // border: InputBorder(borderSide: )
              ),
          style: TextStyle(
            color: Colors.black,
          ),
        ));
  }

  //converts hex color to flutter color
  Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
