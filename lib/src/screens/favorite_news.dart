import 'package:flutter/material.dart';
import 'package:news/src/widgets/latest_news_list.dart';
import '../blocs/latest_news_provider.dart';

class FavoriteNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Column(
        children: [LatestNewsList(bloc, bloc.savedNewsStream, 'FavoriteNews')],
      ),
    );
  }
}
