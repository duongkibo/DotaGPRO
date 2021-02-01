import 'package:flutter_architecture/data/livestream/model/box_stream.dart';
import 'package:flutter_architecture/domain/livestream/repositories/box_stream_repository.dart';

class BoxStreamUsecases {
  final BoxStreamRepository _boxStreamRepository;

  BoxStreamUsecases(this._boxStreamRepository);
  Future<BoxStream> getLiveStream(String dager) =>
      _boxStreamRepository.getStream(dager);
}
