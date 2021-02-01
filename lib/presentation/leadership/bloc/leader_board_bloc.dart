import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';
import 'package:flutter_architecture/domain/dota/usecases/competitive_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'leader_board_event.dart';
part 'leader_board_state.dart';

class LeaderBoardBloc extends Bloc<LeaderBoardEvent, LeaderBoardState> {
  final CompetitiveUseCases competitiveUseCases;
  LeaderBoardBloc({this.competitiveUseCases}) : super(LeaderBoardInitial());

  @override
  Stream<LeaderBoardState> mapEventToState(
    LeaderBoardEvent event,
  ) async* {
    if (event is LoadLeaderBoardEvent) {
      yield* _mapLoadedCompetitive();
    }
    // yield LeaderBoardSuccess();
    // yield LeaderBoardInitial();
  }

  Stream<LeaderBoardState> _mapLoadedCompetitive() async* {
    try {
      yield LeadBoardLoading();
      var competive = await competitiveUseCases.getCompetitive();

      print("competive : $competive");
      if (competive?.isEmpty ?? true) {
        yield LeaderBoardErros(erros: 'no data');
      } else {
        yield LeaderBoardSuccess(competitive: competive);
      }
    } on ApiException catch (e) {
      yield LeaderBoardErros(erros: e.errorMessage);
    } catch (_) {
      yield LeaderBoardErros(erros: S.current.connectionProblem);
    }
  }
}
