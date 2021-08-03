import 'package:flutter/material.dart';

class BasedOnCats extends StatelessWidget {
  final String category;
  BasedOnCats(this.category);

  @override
  Widget build(BuildContext context) {
    return Text(category.toString());
  }
}