import 'package:flutter/material.dart';
import 'package:news/src/resources/categories.dart';
import 'package:news/src/widgets/latest_news_list.dart';
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
      child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
            unselectedLabelColor: Colors.black,
          labelColor: Colors.blue, 
            tabs: [
              Tab(
                text: "Home",
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
                      // StreamBuilder(
                      //   stream: bloc.searchedListBuilderStream,
                      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //     if (snapshot.hasData) {
                      //       return LatestNewsList(bloc, bloc.searchedListBuilderStream);
                      //     }
                      //   },
                      // )
                    ],
                  ),
                  Text('This is good'),
                  LatestNewsList(bloc, bloc.searchedListBuilderStream)
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
