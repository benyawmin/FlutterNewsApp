import 'package:flutter/material.dart';
import 'package:news/src/widgets/expanding_list.dart';
import '../resources/regions.dart';

class Area extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpandingList(regions)
      ],
    );
  }
}