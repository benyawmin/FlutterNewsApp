import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/loading_latest_news.dart';

class BasedOnCats extends StatelessWidget {
  final String category;
  BasedOnCats(this.category);

  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    bloc.fetchLatestNewsByCategory(category);
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: 
        StreamBuilder(
          stream: bloc.filteredbyCatStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data[1].toString());
              ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  // print(snapshot.data[index].toString());
                  return Text(snapshot.data[index].id.toString());
                },
              );
              return Text('Nothing found');
            } 
            else
              return LoadingLatestNews();
          },
        )
        // LatestNewsList(bloc, bloc.filteredbyCatStream),
        );
  }
}
