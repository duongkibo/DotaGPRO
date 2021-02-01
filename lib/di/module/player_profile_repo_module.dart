import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/player_profile_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class PlayerProfileRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<PlayerProfileRepo>(
        () => PlayerProfileRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
