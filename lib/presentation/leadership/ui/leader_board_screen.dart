import 'package:flutter/material.dart';
import 'package:flutter_architecture/presentation/leadership/bloc/leader_board_bloc.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/matchdetail/match_detail_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';

import 'component/item_data.dart';

class LeaderBoardScreen extends StatefulWidget {
  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  LeaderBoardBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadLeaderBoardEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: BlocConsumer<LeaderBoardBloc, LeaderBoardState>(
        listener: (context, state) {
          print("state listener : $state");
        },
        builder: (context, state) {
          print(state);
          if (state is LeadBoardLoading) {
            return LoadingPageList();
          } else if (state is LeaderBoardSuccess) {
            print('xxxxx $state.competitive.length');
            return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: state.competitive.length,
                itemBuilder: (BuildContext context, int index) {
                  Competitive competitive = state.competitive[index];
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MatchDetailRoute.id,
                            arguments: competitive.matchId);
                      },
                      child: ItemData(
                        competitive: competitive,
                      ));
                });
          }
          return Container(
            child: Text('xxxx'),
          );
        },
      ),
    );
  }
}
