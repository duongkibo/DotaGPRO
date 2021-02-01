import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/news/ui/component/profile_picture.dart';
import 'package:flutter_architecture/presentation/profile/profile_route.dart';
import 'package:flutter_architecture/presentation/proplayer/bloc/pro_player_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPro extends StatefulWidget {
  @override
  _ListProState createState() => _ListProState();
}

class _ListProState extends State<ListPro> {
  ProPlayerBloc _bloc;
  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadProPlayerEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 61,
        child: BlocConsumer<ProPlayerBloc, ProPlayerState>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            if (state is ProPlayerLoading) {
              return LoadingPageList();
            } else if (state is ProPlayerSuccess) {
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.proPlayer.length,
                  itemBuilder: (BuildContext context, int index) {
                    ProPlayer proPlayer = state.proPlayer[index];
                    return Container(
                      margin: index != state.proPlayer.length
                          ? const EdgeInsets.only(right: 15)
                          : EdgeInsets.zero,
                      child: GestureDetector(
                        child: ProfilePicture(
                          url: proPlayer.avatarFull,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, ProfileRoute.id,
                              arguments: proPlayer.accountId);
                        },
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text('nodata'),
              );
            }
          },
        ));
  }
}
