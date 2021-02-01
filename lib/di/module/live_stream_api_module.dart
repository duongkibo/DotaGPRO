import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/dota/source/remote/dota_api.dart';
import 'package:flutter_architecture/data/livestream/source/live_stream_api.dart';
import 'package:flutter_architecture/data/user/source/remote/user_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'dart:async';
import 'package:dio/dio.dart';

class LiveStreamApiModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton(LiveStreamApi(getIt<Dio>(),
        baseUrl: 'https://dagger-proxy-twitch.herokuapp.com/'));
  }
}
