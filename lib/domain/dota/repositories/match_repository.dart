import 'package:flutter_architecture/data/dota/model/matchstats/matchstatss.dart';

abstract class MatchRepository {
  Future<MatchStatss> getMatch(int matchId);
}
