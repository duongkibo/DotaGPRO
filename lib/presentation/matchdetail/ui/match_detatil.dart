import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/playerstats.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/matchdetail/bloc/match_detail_bloc.dart';
import 'package:flutter_architecture/presentation/matchdetail/ui/component/item_player.dart';
import 'package:flutter_architecture/presentation/profile/profile_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchDetail extends StatefulWidget {
  @override
  _MatchDetailState createState() => _MatchDetailState();
}

class _MatchDetailState extends State<MatchDetail> {
  MatchDetailBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadMatchDetail());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollControllers = ScrollController(
      initialScrollOffset: 10, // or whatever offset you wish
      keepScrollOffset: true,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: BlocConsumer<MatchDetailBloc, MatchDetailState>(
        listener: (context, state) {
          print("state listener : $state");
        },
        builder: (context, state) {
          if (state is MatchDetailLoading) {
            return LoadingPageList();
          } else if (state is MatchDetailSuccess) {
            String radianName = state.matchStatss.radiantTeam.name;
            String direName = state.matchStatss.direTeam.name;
            String radianScore = state.matchStatss.radiantScore.toString();
            String direScore = state.matchStatss.direScore.toString();

            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'MATCH DETAILS',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Row(children: [
                              SizedBox(
                                width: size.width * 0.6,
                                height: size.height * 0.1,
                                child: Text(
                                  '$radianName',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      backgroundColor:
                                          Colors.green.withOpacity(0.5)),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                                height: size.height * 0.1,
                                child: Text('$radianScore',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24)),
                              )
                            ]),
                            left: 0,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 12,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              PlayerStats playerStats =
                                  state.matchStatss.players[index];
                              if (playerStats.isRadiant == true) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProfileRoute.id,
                                          arguments: playerStats.id);
                                    },
                                    child: ItemPLayer(playerStats));
                              } else {
                                return Text('');
                              }
                            },
                            itemCount: state.matchStatss.players.length,
                            scrollDirection: Axis.vertical,
                          ),
                        )),
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Row(children: [
                              SizedBox(
                                width: size.width * 0.6,
                                height: size.height * 0.1,
                                child: Text(
                                  '$direName',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.5)),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.2,
                              ),
                              SizedBox(
                                  width: size.width * 0.2,
                                  height: size.height * 0.1,
                                  child: Text('$direScore',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 24)))
                            ]),
                            left: 0,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 12,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: ListView.builder(
                            controller: scrollControllers,
                            itemCount: state.matchStatss.players.length,
                            itemBuilder: (BuildContext context, int index) {
                              PlayerStats playerStats =
                                  state.matchStatss.players[index];

                              if (playerStats.isRadiant == false) {
                                return GestureDetector(
                                  child: ItemPLayer(playerStats),
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProfileRoute.id,
                                        arguments: playerStats.id);
                                  },
                                );
                              } else {
                                return Text('');
                              }
                            },
                          ),
                        ))
                  ],
                ),
              ),
            );
          } else {
            return Text('Match Detail');
          }
        },
      ),
    );
  }
}
