import 'package:flutter_architecture/data/dota/model/profile/players.dart';

abstract class PlayerProfileRepository {
  Future<Players> getPlayerProfile(int id);
}
