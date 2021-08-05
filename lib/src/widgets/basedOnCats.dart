import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/resources/news_api_provider.dart';
import 'loading_latest_news.dart';

class BasedOnCats extends StatelessWidget {
  final String category;
  BasedOnCats(this.category);
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    // var newsFiltered = bloc.fetchLatestNewsByCategory();
    NewsApiProvider().fetchSearchedNews('new');
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body: StreamBuilder(
          stream: bloc.filteredbyCat,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text('hi');
                    // List cats = [];
                    // for (var cat in snapshot.data[index].category) {
                    //     if (cat == category) 
                    //       cats.add(snapshot.data[index]);
                    // }
                    // print(cats);
                    // if (cats.isNotEmpty) {
                      // return Text(newsFiltered.toString());
                      // NewsListBuilderItems(snapshot, index);
                    // }
                    // return Container();
                  });
            }
            return Center(
              child: LoadingLatestNews(),
            );
          },
        ));
  }
}
