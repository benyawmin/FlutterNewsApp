import 'package:flutter/material.dart';

class LoadingCategories extends StatefulWidget {
  createState() {
    return new LoadingCategoriesState();
  }
}

class LoadingCategoriesState extends State<LoadingCategories>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationController,
        child: Row(
          children: [
            SizedBox(width: 10),
            buildContainer(),
            SizedBox(width: 10),
            buildContainer(),
            SizedBox(
              width: 10,
            ),
            buildContainer(),
            SizedBox(
              width: 10,
            ),
            Expanded(child: buildContainer())
          ],
        ));
  }

  buildContainer() {
    return Container(
      width: 100,
      height: 100,
      color: Colors.grey[350],
      margin: EdgeInsets.only(top: 10, bottom: 10),
    );
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }
}
