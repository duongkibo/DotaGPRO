import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/competitive_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class CompetitiveRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<CompetitiveRepo>(
        () => CompetitiveRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
