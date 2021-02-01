import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';

abstract class CompetitiveRepository {
  Future<List<Competitive>> getCompetitive();
}
