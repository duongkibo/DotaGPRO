import 'package:flutter_architecture/data/dota/model/profile/players.dart';
import 'package:flutter_architecture/domain/dota/repositories/player_profile_repository.dart';

class PlayerProfileUseCases {
  PlayerProfileRepository _playerProfileRepository;
  PlayerProfileUseCases(this._playerProfileRepository);
  Future<Players> getPlayerProfile(int id) =>
      _playerProfileRepository.getPlayerProfile(id);
}
