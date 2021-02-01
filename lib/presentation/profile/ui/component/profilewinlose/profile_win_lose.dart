import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/profilewinlose/bloc/profile_win_lose_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../global.dart';

class ProfileWinLose extends StatefulWidget {
  @override
  _ProfileWinLoseState createState() => _ProfileWinLoseState();
}

class _ProfileWinLoseState extends State<ProfileWinLose> {
  ProfileWinLoseBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadProfileWinLose());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileWinLoseBloc, ProfileWinLoseState>(
        builder: (context, state) {
      if (state is ProfileWinLoseLoading) {
        return LoadingPageList();
      } else if (state is ProfileWinLoseSuccess) {
        PlayerWinLose playerWinLose = state.playerWinLose;
        int win = playerWinLose.win;
        int lose = playerWinLose.lose;
        int sum = win + lose;
        String winRates = '${((win / sum) * 100)}';
        var winRateX = winRates.split('.')[0].substring(0, 2);
        print('xxxxx win rate $winRateX');

        return Container(
          padding: EdgeInsets.all(15.0),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "$win",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Win",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "$lose",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Lose",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(
                      "$winRateX%",
                      // "",
                      style: Theme.of(context).textTheme.headline.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      "Win Rate",
                      style: Theme.of(context).textTheme.subhead.copyWith(
                            color: greenColor,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      } else {
        return Text('nodata');
      }
    }, listener: (context, state) {
      print('state of win lose $state');
    });
  }
}
