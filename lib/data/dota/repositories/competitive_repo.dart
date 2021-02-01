import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/domain/dota/repositories/competitive_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';

class CompetitiveRepo implements CompetitiveRepository {
  DotaApi dotaApi;

  CompetitiveRepo({this.dotaApi});

  @override
  Future<List<Competitive>> getCompetitive() async {
    try {
      return await dotaApi.getCompetitive();
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
