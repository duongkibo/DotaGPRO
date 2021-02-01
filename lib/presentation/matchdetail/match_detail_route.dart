import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/match_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/match_usecases.dart';
import 'package:flutter_architecture/presentation/matchdetail/bloc/match_detail_bloc.dart';
import 'package:flutter_architecture/presentation/matchdetail/ui/match_detatil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchDetailRoute extends RouteDefine {
  static const id = 'matchdetail';
  static const id_with_param = 'param_id';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                create: (_) => MatchDetailBloc(
                    matchUseCases: MatchUseCases(getIt<MatchRepo>()),
                    matchId: arguments),
                child: MatchDetail())),
      ];
}
