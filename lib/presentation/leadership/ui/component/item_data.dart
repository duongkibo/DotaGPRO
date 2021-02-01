import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';

class ItemData extends StatelessWidget {
  final Competitive competitive;

  ItemData({this.competitive});

  @override
  Widget build(BuildContext context) {
    String name = competitive.radiantName;
    String direName = competitive.direName;
    return GestureDetector(
      child: Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: Image.asset(
                'assets/images/champion.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            title: Text(
              '$name  \n        vs \n$direName ',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),

            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
