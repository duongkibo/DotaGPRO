import 'package:flutter/material.dart';
import 'package:flutter_architecture/global.dart';

class NewsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        Text(
          "DOTA-G-PRO",
          style: Theme.of(context).textTheme.title.copyWith(
                color: Colors.white,
              ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: greenColor, width: 3),
          ),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://image.freepik.com/free-vector/golden-champion-cup-with-stars-vector-realistic-3d-illustration-championship-trophy-sport-tournament-award-victory-concept_148995-25.jpg'),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
