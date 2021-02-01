import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';

class ItemUKnow extends StatelessWidget {
  final ProPlayer player;

  ItemUKnow({this.player});

  @override
  Widget build(BuildContext context) {
    String name = player.personaname;
    String avatarUrl = player.avatarFull;
    String id = player.teamName;
    return GestureDetector(
      child: Card(
        elevation: 4.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black87),
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right:
                          new BorderSide(width: 1.0, color: Colors.white24))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    '$avatarUrl',
                    fit: BoxFit.fitWidth,
                    height: 50.0,
                    width: 50.0,
                  )),
            ),
            title: Text(
              ' $name \n Team:$id ',
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
