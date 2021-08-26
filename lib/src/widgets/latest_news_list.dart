import 'package:flutter/material.dart';
import 'package:news/src/widgets/news_list_builder.dart';
import 'loading_latest_news.dart';

class LatestNewsList extends StatelessWidget {
  final bloc;
  final blocStream;
  final fromWidget;

  LatestNewsList(this.bloc, this.blocStream, this.fromWidget);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: blocStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // print(snapshot.data.toString());
            return NewsListBuilder(snapshot);
          } else if (snapshot.hasError) {
            return Text('Nothing was found');
          }
          if (fromWidget == 'FavoriteNews')
          return Center(
            child: Text('No Favorites yet', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 26),),
          );
          return Center(
            child: LoadingLatestNews(),
          );
        });
  }
}
