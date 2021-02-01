import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';
import 'package:flutter_architecture/domain/dota/repositories/player_win_lose_repository.dart';

class PlayerWinLoseUseCases {
  PlayerWinLoseRepository _loseRepository;
  PlayerWinLoseUseCases(this._loseRepository);
  Future<PlayerWinLose> getPlayerWinLose(int playerId) =>
      _loseRepository.getPlayerWinLose(playerId);
}
