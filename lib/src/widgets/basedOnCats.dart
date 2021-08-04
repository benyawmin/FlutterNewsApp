import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/latest_news_list.dart';
import 'package:news/src/widgets/news_list_builder.dart';

import 'loading_latest_news.dart';

class BasedOnCats extends StatelessWidget {
  final String category;
  BasedOnCats(this.category);

  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);

    // bloc.filteredbyCat.stream.map((event) {
    //   for (var i in event) {
    //     for (var cat in i.category) {
    //       if (cat == category) return i.category;
    //     }
    //   }
    // }).listen((e) {
    //   print(e);
    //   bloc.filteredbyCat.sink.add(null);
    // });

    bloc.fetchLatestNewsByCategory(category);
    return Scaffold(
        appBar: AppBar(
          title: Text('News'),
        ),
        body:
        //  Text('s')
            //  LatestNewsList(bloc, bloc.filteredCatOutput));
            StreamBuilder(
          stream: bloc.filteredbyCat,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  filter(String value) => value.contains(category);

                  if (snapshot.data[index].category.toList().any(filter) == true)
                    return NewsListBuilder(snapshot);
                  else
                    return Container();
                  // return Text(
                  //     snapshot.data[index].category.toList().toString());
                },
              );
            }
            return Center(
              child: LoadingLatestNews(),
            );
          },
        ));
  }
}
