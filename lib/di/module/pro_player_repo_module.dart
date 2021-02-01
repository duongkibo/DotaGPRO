import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/pro_player_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class ProPlayerRepoModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory<ProPlayerRepo>(
        () => ProPlayerRepo(dotaApi: getIt<DotaApi>()));
  }
}
