import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/repositories/player_win_lose_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/player_win_lose_usecases.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/profile/bloc/profile_bloc.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/profile_footer.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/profile_header.dart';
import 'package:flutter_architecture/presentation/profile/ui/component/profilewinlose/bloc/profile_win_lose_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file:///C:/Users/Kibzz/StudioProjects/Flutter_Architecture/lib/presentation/profile/ui/component/profilewinlose/profile_win_lose.dart';

class ProfileScreen extends StatefulWidget {
  final int accountId;

  ProfileScreen({this.accountId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is ProfileLoading) {
            return LoadingPageList();
          } else if (state is ProfileSuccess) {
            var players = state.players.player;
            return SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(bottom: 10),
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                children: [
                  ProfileHeader(
                    player: players,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: BlocProvider(
                      create: (_) => ProfileWinLoseBloc(
                          id: widget.accountId,
                          playerWinLoseUseCases: PlayerWinLoseUseCases(
                              getIt<PlayerWinLoseRepo>())),
                      child: ProfileWinLose(),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ProfileFooter(
                      id: widget.accountId,
                    ),
                  )
                ],
              ),
            ));
          } else {
            return Center(
              child: Text('nodata'),
            );
          }
        },
      ),
    );
  }
}
