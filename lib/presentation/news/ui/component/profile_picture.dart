import 'package:flutter/material.dart';
import 'package:flutter_architecture/global.dart';

class ProfilePicture extends StatelessWidget {
  String url;

  ProfilePicture({this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: greenColor, width: 3),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(url),
        backgroundColor: Colors.white,
      ),
    );
  }
}
