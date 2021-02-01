import 'package:flutter_architecture/data/dota/model/matchstats/matchstatss.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/match_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class MatchRepo implements MatchRepository {
  DotaApi dotaApi;
  MatchRepo({this.dotaApi});
  @override
  Future<MatchStatss> getMatch(int matchId) async {
    try {
      assert(matchId != null);
      return await dotaApi.getMatch(matchId);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
