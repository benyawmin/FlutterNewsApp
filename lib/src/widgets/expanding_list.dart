import 'package:flutter/material.dart';
import 'basedOnData.dart';

class ExpandingList extends StatelessWidget {
  final items;
  final String title;

  ExpandingList(this.items, this.title);

  @override
  Widget build(BuildContext context) {
    return listBuilder(context);
  }

  listBuilder(context) {
    if (title == 'Categories') {
      return ExpansionTile(
        trailing: Text(
          'See all',
          style: TextStyle(color: Colors.blue),
        ),
        title: Text(title),
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
                                builder: (context) =>
                                    BasedOnData(i, title)));
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
    } else {
     return ExpansionTile(
      trailing: Text(
        'See all',
        style: TextStyle(color: Colors.blue),
      ),
      title: Text(title),
      children: [
        Wrap(
          children: [
            for (var i in items.entries)
              Container(
                  width: 100,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BasedOnData(i.value.toString(), title)));
                    },
                    child: Card(
                      child: Center(
                        child: Text(i.key),
                      ),
                    ),
                  ))
          ],
        ),
      ],
    );
    }
  }
}
