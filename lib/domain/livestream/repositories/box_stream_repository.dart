import 'package:flutter_architecture/data/livestream/model/box_stream.dart';

abstract class BoxStreamRepository {
  Future<BoxStream> getStream(String dager);
}
