import 'package:flutter_architecture/data/livestream/model/box_stream.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'live_stream_api.g.dart';

@RestApi(baseUrl: '')
abstract class LiveStreamApi {
  factory LiveStreamApi(Dio dio, {String baseUrl}) = _LiveStreamApi;
  static const String a = 'Client-DPT: dagger';
  @GET('streams')
  Future<BoxStream> getLiveStream(@Header('Client-DPT') String dager);
}
