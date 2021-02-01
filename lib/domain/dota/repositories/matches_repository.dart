import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';

abstract class MatchesRepository {
  Future<List<Matchs>> getMatches(int playerId);
}
