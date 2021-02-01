import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/matchstatss.dart';
import 'package:flutter_architecture/domain/dota/usecases/match_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'match_detail_event.dart';
part 'match_detail_state.dart';

class MatchDetailBloc extends Bloc<MatchDetailEvent, MatchDetailState> {
  final int matchId;
  final MatchUseCases matchUseCases;

  MatchDetailBloc({this.matchId, this.matchUseCases})
      : super(MatchDetailInitial());

  @override
  Stream<MatchDetailState> mapEventToState(
    MatchDetailEvent event,
  ) async* {
    if (event is LoadMatchDetail) {
      yield* _mapLoadedMatchDetail(matchId);
    }
  }

  Stream<MatchDetailState> _mapLoadedMatchDetail(int matchId) async* {
    try {
      yield MatchDetailLoading();
      var matchDetail = await matchUseCases.getMatch(matchId);

      print("match : $matchDetail");
      if (matchDetail.matchId == null) {
        yield MatchDetaildErros(erros: 'no data');
      } else {
        yield MatchDetailSuccess(matchStatss: matchDetail);
      }
    } on ApiException catch (e) {
      yield MatchDetaildErros(erros: e.errorMessage);
    } catch (_) {
      yield MatchDetaildErros(erros: S.current.connectionProblem);
    }
  }
}
