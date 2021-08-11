import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/src/screens/home_details_screen.dart';
import 'package:news/src/widgets/loading_categories.dart';
import 'package:share_plus/share_plus.dart';

class HorizontalLatestList extends StatelessWidget {
  final bloc;
  final blocStream;
  final typeData;
  final type;

  HorizontalLatestList(this.bloc, this.blocStream,
   this.typeData, this.type
   );

  @override
  Widget build(BuildContext context) {
    if (type == 'Region') {
      bloc.fetchByRegion(typeData);
    } else if (type == 'Category') {
      
    }
    return StreamBuilder(
      stream: blocStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return
                  // SingleChildScrollView(
                  // child:
                  Container(
                width: 200,
                child: GestureDetector(
                  onTap: () {
                    if (snapshot.hasData) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeDetailsScreen(
                                    snapshot,
                                    index,
                                    latestNewsImage(snapshot, index),
                                  )));
                    }
                  },
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        latestNewsImage(snapshot, index),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Text(
                              (snapshot.data[index]).title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            // margin: EdgeInsets.only(top: 50),
                            child: Row(children: [
                              GestureDetector(
                                child: Icon(
                                  Icons.share_outlined,
                                  color: Colors.grey,
                                ),
                                onTap: () =>
                                    Share.share((snapshot.data[index]).url),
                              ),
                              Icon(Icons.bookmark_border_outlined)
                              // GestureDetector(
                              //   child: Icon(selected
                              //       ? Icons.bookmark
                              //       : Icons.bookmark_border_outlined),
                              //   onTap: () {
                              //     setState(() {
                              //       selected = !selected;
                              //       _repository.addToDb(
                              //           widget.snapshot.data[widget.index]);
                              //       bloc.addToSavedNews(
                              //           widget.snapshot, widget.index);
                              //     });
                              //   },
                              // )
                            ]),
                          ),
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
              // );
            },
          );
        }
        return LoadingCategories();
      },
    );
  }

  latestNewsImage(snapshot, index) {
    if ((snapshot.data[index]).image != '') {
      return Container(
        width: double.infinity,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          height: 140,
          imageUrl: snapshot.data[index].image,
          placeholder: (context, url) => new Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
        // margin: EdgeInsets.only(bottom: 10),
      );
    } else {
      return Text('No image available or still waiting for image!');
    }
  }
}
