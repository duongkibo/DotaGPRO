import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:flutter_architecture/data/livestream//model/live_streams.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/profile/profile_route.dart';
import 'package:flutter_architecture/presentation/proplayer/bloc/pro_player_bloc.dart';
import 'package:flutter_architecture/presentation/searchs/ui/component/item_u_know.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MayBeUKnow extends StatefulWidget {
  @override
  _MayBeUKnowState createState() => _MayBeUKnowState();
}

class _MayBeUKnowState extends State<MayBeUKnow> {
  ProPlayerBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadProPlayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<ProPlayerBloc, ProPlayerState>(
          listener: (context, state) {
        print(state);
      }, builder: (context, state) {
        if (state is ProPlayerLoading) {
          return LoadingPageList();
        } else if (state is ProPlayerSuccess) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              ProPlayer player = state.proPlayer[index];
              return SizedBox(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ProfileRoute.id,
                          arguments: player.accountId);
                    },
                    child: ItemUKnow(
                      player: player,
                    )),
                width: double.infinity,
                height: size.height * 0.1,
              );
            },
            itemCount: state.proPlayer.length,
          );
        } else {
          return Center(child: Text('no data'));
        }
      }),
    );
  }
}
