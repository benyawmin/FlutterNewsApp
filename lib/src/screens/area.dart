import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/expanding_list.dart';
import '../resources/regions.dart';
import '../widgets/horizontal_latest_list.dart';

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    bloc.r1Fetch('US');
    bloc.r2Fetch('CN');
    bloc.r3Fetch('IT');

    return SingleChildScrollView(child: Column(
      children: [
        ExpandingList(regions, 'Regions'),
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'USA',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.r1Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'China',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.r2Stream),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'Italy',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  )),
              Container(
                height: 200,
                child: HorizontalLatestList(bloc, bloc.r3Stream),
              )
            ],
          ),
      ],
    )) ;
  }
}
