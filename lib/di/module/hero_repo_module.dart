import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/repositories/hero_repo.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class HeroRepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory<HeroRepo>(
        () => HeroRepo(dotaApi: getIt.get<DotaApi>()));
  }
}
