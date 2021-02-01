import 'package:flutter_architecture/data/dota/model/profile/hero/hero.dart';
import 'package:flutter_architecture/domain/dota/repositories/hero_repository.dart';

class HeroUseCases {
  HeroRepository _heroRepository;
  HeroUseCases(this._heroRepository);
  Future<List<Hero>> getHeroes(int playerId) =>
      _heroRepository.getHeroes(playerId);
}
