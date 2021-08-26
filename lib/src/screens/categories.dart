import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/expanding_list.dart';
import 'package:news/src/widgets/horizontal_latest_list.dart';
import '../resources/categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    bloc.c1Fetch('programming');
    bloc.c2Fetch('general');
    bloc.c3Fetch('sports');
    bloc.c4Fetch('academia');
    bloc.c5Fetch('politics');
    return SingleChildScrollView(
      child: Column(
        children: [
          ExpandingList(getCategories(), 'Categories'),
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'programming',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.c1Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'general',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.c2Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'sports',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.c3Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'academia',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.c4Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'politics',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.c5Stream),
              )
            ],
          ),
        ],
      ),
    );
  }
}
