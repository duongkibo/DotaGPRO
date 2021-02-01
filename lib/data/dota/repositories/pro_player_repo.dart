import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/pro_player_repository.dart';
import 'package:dio/dio.dart';

class ProPlayerRepo implements ProPlayerRepository {
  DotaApi dotaApi;

  ProPlayerRepo({this.dotaApi});

  @override
  Future<List<ProPlayer>> getProPlayer() async {
    try {
      return await dotaApi.getProPlayer();
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
