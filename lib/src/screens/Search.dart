import 'package:flutter/material.dart';
import 'package:news/src/resources/categories.dart';
import 'package:news/src/widgets/latest_news_list.dart';
import 'package:news/src/widgets/news_list_builder.dart';
import 'package:news/src/widgets/searchbar.dart';
import '../blocs/latest_news_bloc.dart';
import '../blocs/latest_news_provider.dart';

class Search extends StatelessWidget {
  final tab = new TabBar(tabs: <Tab>[
    new Tab(icon: new Icon(Icons.arrow_forward)),
    new Tab(icon: new Icon(Icons.arrow_downward)),
    new Tab(icon: new Icon(Icons.arrow_back)),
  ]);

  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);

    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: [
              SearchBar(),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://picsum.photos/200/300'),
                ),
              ),
            ],
          ),
          Container(
            child: TabBar(
                unselectedLabelColor: Colors.black,
                labelColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Latest",
                  ),
                  Tab(text: "Articles"),
                  Tab(text: "User"),
                ]),
          ),
          Container(
            //Add this to give height
            height: MediaQuery.of(context).size.height,
            child: TabBarView(children: [
              Column(
                children: [
                  StreamBuilder(
                    stream: bloc.searchedListBuilderStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return NewsListBuilder(snapshot);
                      } else if (snapshot.hasError) {
                        return Text('No results found');
                      }
                      bloc.fetchLatestNews();

                      return Expanded(child: Column(
                        children: [
                          Text('This is the place holder for horizontal list'),
                          LatestNewsList(bloc, bloc.newsStream),
                        ],
                      )) ;
                    },
                  )
                ],
              ),
              Container(
                child: Text("Articles Body"),
              ),
              Container(
                child: Text("User Body"),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
