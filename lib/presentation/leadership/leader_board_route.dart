import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/competitive_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/competitive_usecases.dart';
import 'package:flutter_architecture/presentation/leadership/bloc/leader_board_bloc.dart';
import 'package:flutter_architecture/presentation/leadership/ui/leader_board_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderBoardRoute extends RouteDefine {
  static const id = 'leaderboard';
  static const id_with_param = 'account_id';
  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                create: (_) => LeaderBoardBloc(
                    competitiveUseCases:
                        CompetitiveUseCases(getIt<CompetitiveRepo>())),
                child: LeaderBoardScreen())),
      ];
}
