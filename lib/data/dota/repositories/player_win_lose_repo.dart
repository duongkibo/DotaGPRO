import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/player_win_lose_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class PlayerWinLoseRepo implements PlayerWinLoseRepository {
  DotaApi dotaApi;
  PlayerWinLoseRepo({this.dotaApi});

  @override
  Future<PlayerWinLose> getPlayerWinLose(int playerId) async {
    try {
      assert(playerId != null);
      return await dotaApi.getPlayerWinLose(playerId);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
