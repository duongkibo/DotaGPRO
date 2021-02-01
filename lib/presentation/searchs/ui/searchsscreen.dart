import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/repositories/pro_player_repo.dart';
import 'package:flutter_architecture/data/dota/repositories/search_player_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/pro_player_usecases.dart';
import 'package:flutter_architecture/domain/dota/usecases/search_player_usecases.dart';
import 'package:flutter_architecture/presentation/proplayer/bloc/pro_player_bloc.dart';
import 'package:flutter_architecture/presentation/searchs/bloc/search_bloc.dart';
import 'package:flutter_architecture/presentation/searchs/search_route.dart';
import 'package:flutter_architecture/presentation/searchs/ui/component/maybe_u_know.dart';
import 'package:flutter_architecture/presentation/searchs/ui/component/search_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchsScreen extends StatefulWidget {
  @override
  _SearchsScreenState createState() => _SearchsScreenState();
}

class _SearchsScreenState extends State<SearchsScreen> {
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          BeautyTextfield(
            width: double.maxFinite,
            height: 60,
            duration: Duration(milliseconds: 300),
            inputType: TextInputType.text,
            prefixIcon: Icon(
              Icons.person_rounded,
            ),
            placeholder: "Search pro user !",
            onTap: () {
              print('Click');
            },
            onChanged: (t) {
              print(t);
            },
            onSubmitted: (d) {
              Navigator.pushNamed(context, SearchRoute.id, arguments: d);
            },
            suffixIcon: Icon(Icons.search),
          ),
          Center(
            child: Text(
              "May Be You Know",
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (_) => ProPlayerBloc(
                  proPlayerUsesCases:
                      ProPlayerUsesCases(getIt<ProPlayerRepo>())),
              child: MayBeUKnow(),
            ),
          )
        ],
      ),
    );
  }
}
