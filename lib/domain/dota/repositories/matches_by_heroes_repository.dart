import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';

abstract class MatchesByHeroesRepository {
  Future<List<Matchs>> getMatchesByHero(
      int playerId, int heroId, int limit, int offset);
}
