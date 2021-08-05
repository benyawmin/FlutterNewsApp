import 'package:flutter/material.dart';
import 'package:news/src/widgets/news_list_builder.dart';
import 'loading_latest_news.dart';

class LatestNewsList extends StatelessWidget {
  final bloc;
  final blocStream;

  LatestNewsList(this.bloc, this.blocStream);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: blocStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return NewsListBuilder(snapshot);
          } else if (snapshot.hasError) {
            return Text('No results were found');
          }
          return LoadingLatestNews();
        });
  }
}
