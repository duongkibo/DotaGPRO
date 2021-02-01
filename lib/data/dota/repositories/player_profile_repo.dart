import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/profile/players.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/player_profile_repository.dart';

class PlayerProfileRepo implements PlayerProfileRepository {
  DotaApi dotaApi;
  PlayerProfileRepo({this.dotaApi});

  @override
  Future<Players> getPlayerProfile(int id) async {
    try {
      assert(id != null);
      return await dotaApi.getPlayerProfile(id);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
