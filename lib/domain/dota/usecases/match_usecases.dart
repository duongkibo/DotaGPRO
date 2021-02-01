import 'package:flutter_architecture/data/dota/model/matchstats/matchstatss.dart';
import 'package:flutter_architecture/domain/dota/repositories/match_repository.dart';

class MatchUseCases {
  MatchRepository _matchRepository;
  MatchUseCases(this._matchRepository);
  Future<MatchStatss> getMatch(int matchId) =>
      _matchRepository.getMatch(matchId);
}
