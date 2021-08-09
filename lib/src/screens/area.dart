import 'package:flutter/material.dart';
import 'package:news/src/blocs/latest_news_provider.dart';
import 'package:news/src/widgets/expanding_list.dart';
import '../resources/regions.dart';
import '../widgets/horizontal_latest_list.dart';

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    bloc.fetchByRegion('US');
    return Column(
      children: [
        ExpandingList(regions, 'Regions'),
        // Column(
        //   children: [
        // for (var i in regions.entries)
        // Text('Latest News From ${i.key}'),
        Text('title'),
        Container(
          height: 200,
          child: HorizontalLatestList(bloc, bloc.filteredByRegionStream),
        )
        //   ],
        // )
      ],
    );
  }
}
