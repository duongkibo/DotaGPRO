import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/data/dota/repositories/matches_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/matches_usescases.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/matchdetail/match_detail_route.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/matchs/bloc/matchs_bloc.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/matchs/ui/list_matches_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'matchs/ui/matchss.dart';

class ProfileFooter extends StatefulWidget {
  final int id;

  ProfileFooter({this.id});

  @override
  _ProfileFooterState createState() => _ProfileFooterState();
}

class _ProfileFooterState extends State<ProfileFooter> {
  @override
  Widget build(BuildContext context) {
    //BlocProvider.of<MatchsBloc>(context).add(LoadMatchsEvent());
    return DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white,
                  tabs: [
                    Tab(text: 'Match'),
                    Tab(text: 'Heroes'),
                    Tab(text: 'Peer'),
                  ],
                ),
              ),
              Container(
                  height: 400, //height of TabBarView
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: TabBarView(children: <Widget>[
                    Container(
                        child: BlocProvider(
                      create: (_) => MatchsBloc(
                          matchesUseCases:
                              MatchesUseCases(getIt<MatchesRepo>()),
                          id: widget.id),
                      child: ListMatchesScreen(),
                    )),
                    Container(
                      child: Center(
                        child: Text('Display Tab 2',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Display Tab 3',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ]))
            ]));
  }
}
