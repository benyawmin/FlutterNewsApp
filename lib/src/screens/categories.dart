import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/expanding_list.dart';
import '../resources/categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    return Column(
      children: [
        ExpandingList(categories, 'Categories'),
      ],
    );
  }
}
