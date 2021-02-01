import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/search_player_repo.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/domain/dota/usecases/search_player_usecases.dart';
import 'package:flutter_architecture/presentation/searchs/ui/component/search_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/search_bloc.dart';

class SearchRoute extends RouteDefine {
  static const id = 'search';

  @override
  List<Path> initRoute(Object arguments) => [
        Path(
            name: id,
            builder: (_) => BlocProvider(
                  create: (_) => SearchBloc(
                      name: arguments,
                      searchPlayerUseCases:
                          SearchPlayerUseCases(getIt<SearchPlayerRepo>())),
                  child: SearchDetails(),
                )),
      ];
}
