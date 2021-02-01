import 'package:flutter_architecture/data/dota/model/profile/hero/hero.dart';

abstract class HeroRepository {
  Future<List<Hero>> getHeroes(int playerId);
}
