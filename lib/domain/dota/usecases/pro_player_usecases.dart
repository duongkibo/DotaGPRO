import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:flutter_architecture/domain/dota/repositories/pro_player_repository.dart';

class ProPlayerUsesCases {
  final ProPlayerRepository _playerRepository;

  ProPlayerUsesCases(this._playerRepository);
  Future<List<ProPlayer>> getProPlayer() => _playerRepository.getProPlayer();
}
