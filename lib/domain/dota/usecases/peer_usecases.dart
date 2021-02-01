import 'package:flutter_architecture/data/dota/model/profile/peer/peer.dart';
import 'package:flutter_architecture/domain/dota/repositories/peer_repository.dart';

class PeerUseCases {
  PeerRepository _peerRepository;
  PeerUseCases(this._peerRepository);
  Future<List<Peer>> getPeers(int playerId) =>
      _peerRepository.getPeers(playerId);
}
