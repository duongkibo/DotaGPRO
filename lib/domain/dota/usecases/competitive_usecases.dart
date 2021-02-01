import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';
import 'package:flutter_architecture/domain/dota/repositories/competitive_repository.dart';

class CompetitiveUseCases {
  final CompetitiveRepository _competitiveRepository;
  CompetitiveUseCases(this._competitiveRepository);
  Future<List<Competitive>> getCompetitive() =>
      _competitiveRepository.getCompetitive();
}
