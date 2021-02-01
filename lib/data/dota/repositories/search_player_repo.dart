import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/search_player_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class SearchPlayerRepo implements SearchPlayerRepository {
  DotaApi dotaApi;
  SearchPlayerRepo({this.dotaApi});
  @override
  Future<List<Player>> searchPlayer(String name) async {
    try {
      assert(name != null);
      return await dotaApi.searchPlayer(name);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
