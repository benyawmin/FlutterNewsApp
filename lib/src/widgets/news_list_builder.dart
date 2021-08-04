import 'package:flutter/material.dart';
import 'package:news/src/screens/home_details_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'loading_latest_news.dart';

class NewsListBuilder extends StatelessWidget {
  final snapshot;

  NewsListBuilder(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(8),
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 300,
          child: GestureDetector(
            onTap: () {
              if (snapshot.hasData) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomeDetailsScreen(snapshot, index,
                            latestNewsImage(snapshot, index))));
              }
            },
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Align(
                    child: catReturn(snapshot, index),
                    alignment: Alignment.topLeft,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.blue,
                        size: 8,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        (snapshot.data[index]).title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text((snapshot.data[index]).description),
                  ),
                  SizedBox(
                    child: Container(
                      height: 10,
                    ),
                  ),
                  latestNewsImage(snapshot, index),
                  Align(
                    child: Row(children: [
                      Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 20, bottom: 10),
                          child: Row(
                            children: [
                              Text('Share'),
                              GestureDetector(
                                child: Icon(Icons.share),
                                onTap: () =>
                                    Share.share((snapshot.data[index]).url),
                              ),
                            ],
                          )),
                      Spacer(),
                      Padding(
                          padding:
                              EdgeInsets.only(top: 10, right: 20, bottom: 10),
                          child: Row(
                            children: [
                              Text('Save'),
                              Icon(Icons.save),
                            ],
                          ))
                    ]),
                    alignment: Alignment.bottomLeft,
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.7),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
          ),
        );
      },
    ));
  }

  latestNewsImage(snapshot, index) {
    if ((snapshot.data[index]).image != '') {
      return Container(
        child: ClipRRect(
          child: CachedNetworkImage(
            imageUrl: snapshot.data[index].image,
            placeholder: (context, url) => new LoadingLatestNews(),
            errorWidget: (context, url, error) => new Icon(Icons.error),
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(20),
      );
    } else {
      return Text('No image available or still waiting for image!');
    }
  }

  catReturn(snapshot, index) {
    var categories = "";
    for (var i in (snapshot.data[index]).category) {
      categories += i + ", ";
    }
    if (categories != null && categories.length > 0) {
      categories = categories.substring(0, categories.length - 2);
    }

    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        categories,
        style: TextStyle(
            color: Colors.orange, decoration: TextDecoration.underline),
      ),
    );
  }
}
