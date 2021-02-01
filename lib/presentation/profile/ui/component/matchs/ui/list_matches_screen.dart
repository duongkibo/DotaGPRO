import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/matchdetail/match_detail_route.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/matchs/bloc/matchs_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'matchss.dart';

class ListMatchesScreen extends StatefulWidget {
  @override
  _ListMatchesScreenState createState() => _ListMatchesScreenState();
}

class _ListMatchesScreenState extends State<ListMatchesScreen> {
  MatchsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadMatchsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: BlocConsumer<MatchsBloc, MatchsState>(listener: (context, state) {
        print('$state xxxxxx');
      }, builder: (context, state) {
        print('$state builder');
        if (state is MatchsLoading) {
          return LoadingPageList();
        } else if (state is MatchsSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              Matchs matches = state.matchs[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, MatchDetailRoute.id,
                        arguments: matches.matchId);
                  },
                  child: Matchss(matches));
            },
            itemCount: 20,
            scrollDirection: Axis.vertical,
          );
        } else {
          return Center(
            child: Text('nodata'),
          );
        }
      }),
    );
  }
}
