import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/repositories/pro_player_repo.dart';
import 'package:flutter_architecture/data/livestream/repositories/box_stream_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/pro_player_usecases.dart';
import 'package:flutter_architecture/domain/livestream/usecases/box_stream_usecases.dart';
import 'package:flutter_architecture/presentation/leadership/leader_board_route.dart';
import 'package:flutter_architecture/presentation/livestream/bloc/live_stream_bloc.dart';
import 'package:flutter_architecture/presentation/livestream/ui/list_live_stream.dart';
import 'package:flutter_architecture/presentation/news/ui/component/list_pro.dart';
import 'package:flutter_architecture/presentation/proplayer/bloc/pro_player_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture/presentation/news/ui/component/news_header.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Column(
            children: [
              Container(
                height: size.height * 0.025,
                color: Colors.black,
              ),
              Container(
                height: size.height * 0.2,
                color: Colors.black,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    NewsHeader(),
                    BlocProvider(
                      create: (_) => ProPlayerBloc(
                          proPlayerUsesCases:
                              ProPlayerUsesCases(getIt<ProPlayerRepo>())),
                      child: ListPro(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  child: Container(
                height: size.height * 0.3,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  images: [
                    AssetImage('assets/images/dota2.jpg'),
                    AssetImage('assets/images/dota3.jpg'),
                    AssetImage('assets/images/dota4.jpg'),
                    AssetImage('assets/images/dota5.jpg'),
                    AssetImage('assets/images/dota6.jpg'),
                  ],
                  autoplay: true,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 300),
                  dotBgColor: Colors.transparent,
                  dotSize: 4,
                  showIndicator: false,
                ),
              )),
              SizedBox(
                width: size.width,
                child: Text(
                  'Top Live Stream',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width,
                  child: BlocProvider(
                    create: (_) => LiveStreamBloc(
                        boxStreamUsecases:
                            BoxStreamUsecases(getIt<BoxStreamRepo>())),
                    child: ListLiveStream(),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
