import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/matches_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class MatchesRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<MatchesRepo>(
        () => MatchesRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
