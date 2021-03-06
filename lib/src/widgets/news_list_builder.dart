import 'package:flutter/material.dart';
import 'package:news/src/widgets/news_list_builder_items.dart';

class NewsListBuilder extends StatelessWidget {
  final snapshot;

  NewsListBuilder(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(8),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return NewsListBuilderItems(snapshot, index);
      },
    ));
  }
}
