import 'package:flutter_architecture/config/configuration.dart';
import 'package:flutter_architecture/data/livestream/repositories/box_stream_repo.dart';
import 'package:flutter_architecture/data/livestream/source/live_stream_api.dart';
import 'package:flutter_architecture/di/injection/injection.dart';

class BoxStreamRepoModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory<BoxStreamRepo>(
        () => BoxStreamRepo(liveStreamApi: getIt<LiveStreamApi>()));
  }
}
