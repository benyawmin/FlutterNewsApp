import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomeDetailsScreen extends StatelessWidget {
  final snapshot;
  final index;
  final img;

  HomeDetailsScreen(this.snapshot, this.index, this.img);

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SizedBox(
              //   child: Container(
              //     height: 10,
              //   ),
              // ),
              latestNewsImage(snapshot, index),
              Align(
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text('Share'),
                          GestureDetector(
                            child: Icon(Icons.share),
                            onTap: () =>
                                Share.share((snapshot.data[index]).url),
                          ),
                          catReturn(snapshot, index),
                        ],
                      )),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.only(top: 10, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text('Save'),
                          Icon(Icons.bookmark_border_outlined),
                        ],
                      )),
                ]),
                alignment: Alignment.bottomLeft,
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
                      child: Container(
                        padding: EdgeInsets.all(10),
                    child: Text(
                      snapshot.data[index].title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  )),
                ],
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text((snapshot.data[index]).description),
              ),
            ],
          ),
        ));
  }

 latestNewsImage(snapshot, index) {
    if ((snapshot.data[index]).image != '') {
      return Container(
        width: double.infinity,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          height: 100,
          imageUrl: snapshot.data[index].image,
          placeholder: (context, url) => new Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
        // margin: EdgeInsets.only(bottom: 10),
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
