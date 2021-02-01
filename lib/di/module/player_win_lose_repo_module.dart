import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/player_win_lose_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class PlayerWinLoseRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<PlayerWinLoseRepo>(
        () => PlayerWinLoseRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
