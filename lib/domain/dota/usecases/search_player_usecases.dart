import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/domain/dota/repositories/search_player_repository.dart';

class SearchPlayerUseCases {
  SearchPlayerRepository _playerRepository;
  SearchPlayerUseCases(this._playerRepository);
  Future<List<Player>> searchPlayer(String name) =>
      _playerRepository.searchPlayer(name);
}
