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
                return
                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    Container(
                  width: 220,
                  height: 200,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      alignment: Alignment.center,
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: "https://placeimg.com/640/480/any",
                          placeholder: (context, url) =>
                              new LoadingCategories(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                        Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(top: 70, right: 10, left: 10),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'This is the title',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'sadsadsasdsadsadssadsadadsadass',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
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
