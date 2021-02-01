import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/matches_by_heroes_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class MatchesByHeroRepo implements MatchesByHeroesRepository {
  DotaApi dotaApi;
  MatchesByHeroRepo({this.dotaApi});

  @override
  Future<List<Matchs>> getMatchesByHero(
      int playerId, int heroId, int limit, int offset) async {
    try {
      assert(playerId != null &&
          heroId != null &&
          limit != null &&
          offset != null);
      return await dotaApi.getMatchesByHero(playerId, heroId, limit, offset);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
