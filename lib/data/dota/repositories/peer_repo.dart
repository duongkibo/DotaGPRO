import 'package:flutter_architecture/data/dota/model/profile/peer/peer.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/peer_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class PeerRepo implements PeerRepository {
  DotaApi dotaApi;
  PeerRepo({this.dotaApi});
  @override
  Future<List<Peer>> getPeers(int playerId) async {
    try {
      assert(playerId != null);
      return await dotaApi.getPeers(playerId);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
