import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  static const TextStyle proftxtnormal =
      TextStyle(color: Colors.white, fontSize: 14);
  static const TextStyle proftxtbold =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
  static const TextStyle proftxtunderlined = TextStyle(
      color: Colors.white, decoration: TextDecoration.underline, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 380,
          height: 150,
          margin: EdgeInsets.only(top: 50, left: 10, right: 10),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Profile information', style: proftxtbold),
                    Text('Edit', style: proftxtunderlined)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Name: ', style: proftxtnormal),
                    Text(
                      'Benyamin Jafari',
                      style: proftxtbold,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text('Phone Number: ', style: proftxtnormal),
                    Text(
                      '09116761296',
                      style: proftxtnormal,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            width: 380,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white
              ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Show list of favorites',
                    style: TextStyle(color: Colors.black),),
                    Icon(
                      Icons.arrow_forward_outlined,
                      color: Colors.black,
                    ),
                  ],
                ))
            // onPressed: () {},
            // icon: Icon(
            //   Icons.arrow_forward_outlined,
            //   color: Colors.white,
            // ),
            // label: Text('Show list of favorites')),
            )
      ],
    );
  }
}
