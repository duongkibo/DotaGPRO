import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';

abstract class ProPlayerRepository {
  Future<List<ProPlayer>> getProPlayer();
}
