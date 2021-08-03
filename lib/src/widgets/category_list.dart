import 'package:flutter/material.dart';
import 'loading_categories.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../resources/categories.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          height: 120,
          margin: EdgeInsets.only(top: 15),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (var i in categories)
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: "https://placeimg.com/640/480/any",
                        placeholder: (context, url) => new LoadingCategories(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.7),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    Text(
                      i,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
            ],
            padding: EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
