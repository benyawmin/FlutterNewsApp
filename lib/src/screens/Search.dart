import 'package:flutter/material.dart';
import 'package:news/src/widgets/searchbar.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SearchBar(),
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            )
          ],
        )
      ],
    );
  }
}
