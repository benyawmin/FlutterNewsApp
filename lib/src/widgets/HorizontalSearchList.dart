import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'loading_categories.dart';

class HorizontalSearchList extends StatelessWidget {
  final bloc;
  final blocStream;
  HorizontalSearchList(this.bloc, this.blocStream);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: blocStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 220,
                      height: 200,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://placeimg.com/640/480/any",
                          placeholder: (context, url) =>
                              new LoadingCategories(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'This is the title',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('data')
                      ],
                    ),
                  ],
                );
              },
            ),
          );
        }
        return LoadingCategories();
      },
    );
  }
}
