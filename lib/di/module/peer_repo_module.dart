import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/peer_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class PeerRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<PeerRepo>(
        () => PeerRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
