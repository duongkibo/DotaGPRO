import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';

abstract class SearchPlayerRepository {
  Future<List<Player>> searchPlayer(String name);
}
