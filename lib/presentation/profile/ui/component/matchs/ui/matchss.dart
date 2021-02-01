import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/playerstats.dart';
import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';

class Matchss extends StatefulWidget {
  Matchs matchs;

  Matchss(this.matchs);

  @override
  _MatchssState createState() => _MatchssState();
}

class _MatchssState extends State<Matchss> {
  @override
  Widget build(BuildContext context) {
    String icon = widget.matchs.herId.toString();
    int duration = widget.matchs.duration;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            color: Colors.black.withOpacity(0.5),
            child: FittedBox(
              child: Material(
                color: Colors.black.withOpacity(0.5),
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: new BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        child: Image.asset(
                          'assets/images/ic_hero_$icon.webp',
                          fit: BoxFit.fill,
                          alignment: Alignment.topRight,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      alignment: Alignment.topLeft,
                      child: myDetailsContainer1(context),
                    ),
                    SizedBox(
                      width: size.width * 0.4,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            '${getDuration(duration)} minute',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getDuration(int duration) {
    int minutes = (duration / 60).truncate();
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    return '$minutesStr';
  }

  Widget myDetailsContainer1(BuildContext context) {
    bool isRadiantWin = widget.matchs.isRadiantWin;
    String kill = widget.matchs.kills.toString();
    String deaths = widget.matchs.deaths.toString();
    String assits = widget.matchs.assists.toString();
    String win = '';
    if (isRadiantWin) {
      win = win + 'win';
    } else {
      win = win + 'lose';
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Stack(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  '${win}',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                )),
          ]),
        ),
        Stack(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text('$kill/$deaths/$assits',
                  style: TextStyle(fontSize: 24, color: Colors.white)))
        ])
      ],
    );
  }
}
