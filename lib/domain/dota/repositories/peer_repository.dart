import 'package:flutter_architecture/data/dota/model/profile/peer/peer.dart';

abstract class PeerRepository {
  Future<List<Peer>> getPeers(int playerId);
}
