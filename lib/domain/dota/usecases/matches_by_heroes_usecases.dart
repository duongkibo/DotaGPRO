import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/domain/dota/repositories/matches_by_heroes_repository.dart';

class MatchesByHeroesUseCases {
  MatchesByHeroesRepository _byHeroesRepository;
  MatchesByHeroesUseCases(this._byHeroesRepository);
  Future<List<Matchs>> getMatchesByHero(
          int playerId, int heroId, int limit, int offset) =>
      _byHeroesRepository.getMatchesByHero(playerId, heroId, limit, offset);
}
