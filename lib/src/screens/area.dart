import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/expanding_list.dart';
import '../resources/regions.dart';
import '../widgets/horizontal_latest_list.dart';

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          ExpandingList(regions, 'Regions'),
          // Column(
          //   children: [
          // for (var i in regions.length)
          // Text('Latest News From ${i.key}'),
          // for (var v in regions.values)
          Column(
            children: [
              // Align(
              // alignment: Alignment.centerLeft,
              // child:
              Text(
                'title',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              // ),
              // Container(
              //   height: 200,
              //   child: HorizontalLatestList(
              //       bloc, bloc.filteredByRegionStream, v, 'Region'),
              // )
              Container(
                child: HorizontalLatestList(bloc, bloc.filteredByRegionStream),
              )
            ],
          )
          //   ],
          // )
        ],
      ),
    );
  }
}
