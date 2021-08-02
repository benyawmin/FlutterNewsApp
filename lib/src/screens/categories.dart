import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Categories'),
            Text('See all', 
            style: TextStyle(
              color: Colors.blue,
              ),
            )
          ]
        ),
      ],
    );
  }
}
