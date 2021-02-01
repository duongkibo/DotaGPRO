import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/domain/dota/repositories/matches_repository.dart';

class MatchesUseCases {
  MatchesRepository _matchesRepository;
  MatchesUseCases(this._matchesRepository);
  Future<List<Matchs>> getMatches(int playerId) =>
      _matchesRepository.getMatches(playerId);
}
