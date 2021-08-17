import 'package:flutter/material.dart';
import 'package:news/src/widgets/latest_news_list.dart';
import 'package:news/src/widgets/news_list_builder.dart';
import 'package:news/src/widgets/searchbar.dart';
import '../blocs/latest_news_provider.dart';
import '../widgets/horizontal_search_list.dart';

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
          Container(
            margin: EdgeInsets.only(
              right: 40,
              left: 40,
              top: 20,
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://www.google.com/url?sa=i&url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FImage&psig=AOvVaw3aTX9KaJGyFGdScvU2fqn5&ust=1628978608226000&source=images&cd=vfe&ved=0CAgQjRxqFwoTCJj9k7SAr_ICFQAAAAAdAAAAABAD'),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SearchBar(),
              ],
            ),
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
                      return Expanded(
                          child: Column(
                        children: [
                          HorizontalSearchList(bloc, bloc.newsStream),
                          LatestNewsList(bloc, bloc.newsStream),
                        ],
                      ));
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
