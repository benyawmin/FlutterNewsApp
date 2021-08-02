import 'package:flutter/material.dart';
import 'package:news/src/widgets/loading_categories.dart';
import 'package:news/src/widgets/loading_latest_news.dart';
import '../blocs/latest_news_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'home_details_screen.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    final bloc = LatestNewsProvider.of(context);
    return Column(
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                'categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
        buildCategories(bloc),
        Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 30),
              child: Text(
                'Latest News',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )),
        buildLatestNews(bloc),
      ],
    );
  }

  Widget buildCategories(bloc) {
    return FutureBuilder(
        future: bloc.fetchCategory(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0]);
            return Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  height: 120,
                  margin: EdgeInsets.only(top: 15),
                  child: ListView.builder(
                    padding: EdgeInsets.all(8),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                                'https://placeimg.com/640/480/any',
                                color: Color.fromRGBO(255, 255, 255, 0.57),
                                colorBlendMode: BlendMode.modulate
                                // fit: BoxFit.fill,
                                ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.7),
                            ),
                            elevation: 5,
                            margin: EdgeInsets.all(10),
                          ),
                          Text(
                            snapshot.data[index].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            );
          }
          return Column(
            children: [LoadingCategories()],
          );
        });
  }

  Widget buildLatestNews(bloc) {
    return FutureBuilder(
        future: bloc.fetchLatestNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.toString());
            return Expanded(
                child: SizedBox(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 1, color: Colors.black)),
                    width: 300,
                    child: GestureDetector(
                      onTap: () {
                        if (snapshot.hasData) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeDetailsScreen(snapshot, index)));
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
                                  (snapshot.data[index])['title'].toString(),
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
                              child:
                                  Text((snapshot.data[index])['description']),
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
                                    padding: EdgeInsets.only(
                                        top: 10, left: 20, bottom: 10),
                                    child: Row(
                                      children: [
                                        Text('Share'),
                                        GestureDetector(
                                          child: Icon(Icons.share),
                                          onTap: () => Share.share(
                                              (snapshot.data[index])['url']),
                                        ),
                                      ],
                                    )),
                                Spacer(),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, right: 20, bottom: 10),
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
              ),
            ));
          }
          return LoadingLatestNews();
        });
  }

  catReturn(snapshot, index) {
    var categories = "";
    for (var i in (snapshot.data[index])['category']) {
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

  latestNewsImage(snapshot, index) {
    if ((snapshot.data[index])['image'] != null) {
      return Container(
        child: ClipRRect(
          child: Image.network(
            (snapshot.data[index])['image'],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: EdgeInsets.all(20),
        // width: 300,
        // height: 200,
      );
    } else {
      return Text('No image available!');
    }
  }
}
