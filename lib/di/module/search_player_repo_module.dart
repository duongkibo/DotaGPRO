import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/search_player_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class SearchPlayerRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<SearchPlayerRepo>(
        () => SearchPlayerRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
