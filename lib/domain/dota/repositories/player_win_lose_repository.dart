import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';

abstract class PlayerWinLoseRepository {
  Future<PlayerWinLose> getPlayerWinLose(int playerId);
}
