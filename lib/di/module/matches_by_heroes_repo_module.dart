import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/matches_by_hero_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class MatchesByHeroesRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<MatchesByHeroRepo>(
        () => MatchesByHeroRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
