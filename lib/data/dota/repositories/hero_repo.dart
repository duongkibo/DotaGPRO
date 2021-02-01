import 'package:flutter_architecture/data/dota/model/profile/hero/hero.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/hero_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class HeroRepo implements HeroRepository {
  DotaApi dotaApi;
  HeroRepo({this.dotaApi});
  @override
  Future<List<Hero>> getHeroes(int playerId) async {
    try {
      assert(playerId != null);
      return await dotaApi.getHeroes(playerId);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
