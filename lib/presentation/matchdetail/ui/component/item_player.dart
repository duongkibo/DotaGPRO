import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/playerstats.dart';

class ItemPLayer extends StatelessWidget {
  PlayerStats playerStats;

  ItemPLayer(this.playerStats);

  @override
  Widget build(BuildContext context) {
    String icon = playerStats.heroId.toString();
    String money = playerStats.totalGold.toString();
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4),
          child: Card(
            color: Colors.black.withOpacity(0.3),
            child: FittedBox(
              child: Material(
                color: Colors.black.withOpacity(0.3),
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
                        Image.asset(
                          'assets/images/coin_32.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4),
                          child: Text(
                            '$money',
                            style: TextStyle(fontSize: 15, color: Colors.white),
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

  Widget myDetailsContainer1(BuildContext context) {
    String name = playerStats.personaName;
    String kill = playerStats.kills.toString();
    String deaths = playerStats.deaths.toString();
    String assits = playerStats.deaths.toString();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Stack(children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Text(
                  '$name',
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
