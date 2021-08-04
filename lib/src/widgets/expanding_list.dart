import 'package:flutter/material.dart';
import '../widgets/basedOnCats.dart';

class ExpandingList extends StatelessWidget {
  final items;
  ExpandingList(this.items);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: Text(
        'See all',
        style: TextStyle(color: Colors.blue),
      ),
      title: Text('Categories'),
      children: [
        Wrap(
          children: [
            for (var i in items)
              Container(
                  width: 100,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BasedOnCats(i.toString())));
                    },
                    child: Card(
                      child: Center(
                        child: Text(i.toString()),
                      ),
                    ),
                  ))
          ],
        ),
      ],
    );
  }
}