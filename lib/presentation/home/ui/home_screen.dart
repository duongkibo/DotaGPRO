import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/data/dota/repositories/competitive_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/competitive_usecases.dart';
import 'package:flutter_architecture/presentation/leadership/bloc/leader_board_bloc.dart';
import 'package:flutter_architecture/presentation/leadership/ui/leader_board_screen.dart';
import 'package:flutter_architecture/presentation/news/ui/news_screen.dart';
import 'package:flutter_architecture/presentation/searchs/ui/searchsscreen.dart';
import 'package:flutter_architecture/presentation/stream/ui/stream_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  String tiltel;
  HomeScreen(this.tiltel);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _currentIndex = 0;
  }

  final List<Widget> _children = [
    NewsScreen(),
    BlocProvider(
        create: (_) => LeaderBoardBloc(
            competitiveUseCases: CompetitiveUseCases(getIt<CompetitiveRepo>())),
        child: LeaderBoardScreen()),
    SearchsScreen(),
    StreamScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: _children[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: BubbleBottomBar(
          backgroundColor: Colors.black,
          hasNotch: false,
          opacity: 1,
          currentIndex: _currentIndex,
          onTap: changePage,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ), //border radius doesn't work when the notch is enabled.
          elevation: 16,
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.wine_bar_rounded,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.wine_bar_rounded,
                  color: Colors.white,
                ),
                title:
                    Text("LeaderBoard", style: TextStyle(color: Colors.white))),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: Text("Search", style: TextStyle(color: Colors.white))),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.white,
                ),
                activeIcon: Icon(
                  Icons.favorite_border_sharp,
                  color: Colors.white,
                ),
                title: Text("Favorite", style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
