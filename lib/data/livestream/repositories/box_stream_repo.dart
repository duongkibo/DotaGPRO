import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/livestream/model/box_stream.dart';
import 'package:flutter_architecture/data/livestream/source/live_stream_api.dart';
import 'package:flutter_architecture/domain/livestream/repositories/box_stream_repository.dart';
import 'package:dio/dio.dart';

class BoxStreamRepo implements BoxStreamRepository {
  LiveStreamApi liveStreamApi;

  BoxStreamRepo({this.liveStreamApi});

  @override
  Future<BoxStream> getStream(String dager) async {
    try {
      return await liveStreamApi.getLiveStream(dager);
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
