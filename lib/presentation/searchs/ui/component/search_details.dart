import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/presentation/leadership/ui/component/loading_page_list.dart';
import 'package:flutter_architecture/presentation/profile/profile_route.dart';
import 'package:flutter_architecture/presentation/searchs/bloc/search_bloc.dart';
import 'package:flutter_architecture/presentation/searchs/ui/component/item_search.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchDetails extends StatefulWidget {
  @override
  _SearchDetailsState createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  SearchBloc _bloc;

  @override
  void initState() {
    _bloc = context.read();
    _bloc.add(LoadSearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Search result'),
        centerTitle: true,
        actions: [Icon(Icons.arrow_back)],
        backgroundColor: Colors.transparent,
      ),
      body: BlocConsumer<SearchBloc, SearchState>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          if (state is SearchLoading) {
            return LoadingPageList();
          } else if (state is SearchSuccess) {
            print('${state.player.first.personaname}');
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                Player player = state.player[index];
                return SizedBox(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileRoute.id,
                            arguments: player.id);
                      },
                      child: ItemSearch(
                        player: player,
                      )),
                  width: double.infinity,
                  height: size.height * 0.1,
                );
              },
              itemCount: state.player.length,
            );
          } else {
            return Center(child: Text('no data'));
          }
        },
      ),
    );
  }
}
