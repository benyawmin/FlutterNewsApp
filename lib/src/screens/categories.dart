import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/resources/repository.dart';
import '../resources/categories.dart';
import '../widgets/basedOnCats.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    final repository = Repository();
    return Column(
      children: [
        ExpansionTile(
          trailing: Text(
            'See all',
            style: TextStyle(color: Colors.blue),
          ),
          title: Text('Categories'),
          children: [
            Wrap(
              children: [
                for (var i in categories)
                  Container(
                      width: 100,
                      height: 50,
                      child: GestureDetector(
                          onTap: null,
                          child: GestureDetector(
                            onTap: () {
                              bloc.buildCats(i);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BasedOnCats(i.toString())));
                              // StreamBuilder(
                              //   stream: bloc.catBuilder,
                              //   builder: (context, snapshot) {
                              //     if (snapshot.hasData) {
                              //       Navigator.push(
                              //           context,
                              //           MaterialPageRoute(
                              //               builder: (context) => BasedOnCats(
                              //                   snapshot.data.toString())));
                              //       return Text('error');
                              //     }
                              //     // return ListBuilder(snapshot.data.toString());
                              //     else
                              //       return Text('error');
                              //   },
                              // );
                            },
                            child: Card(
                              child: Center(
                                child: Text(i.toString()),
                              ),
                            ),
                          )))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
