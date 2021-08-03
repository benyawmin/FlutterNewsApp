// import 'package:flutter/material.dart';
// import '../resources/repository.dart';

// class ListBuilder extends StatelessWidget{
//   String category;
//   late List<String> categories = [];
//   ListBuilder(this.category);
  
//   @override
//   Widget build(BuildContext context) {
//     final repository = Repository();
//     final catBasedFetch = repository.fetchLatestNews().where((i) => i.category == category).toList();
//     categories.add(category);
//     return Column(children: [
//       for (var i in categories)
//       ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: catBasedFetch.length,
//         itemBuilder: (context, index) {
//           return Text(catBasedFetch);
//         },
//       )
//     ],);
//   }
// }