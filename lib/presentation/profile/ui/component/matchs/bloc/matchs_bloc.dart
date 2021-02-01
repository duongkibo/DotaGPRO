import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/domain/dota/usecases/matches_usescases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'matchs_event.dart';
part 'matchs_state.dart';

class MatchsBloc extends Bloc<MatchsEvent, MatchsState> {
  MatchesUseCases matchesUseCases;
  int id;
  MatchsBloc({this.matchesUseCases, this.id}) : super(MatchsInitial());

  @override
  Stream<MatchsState> mapEventToState(
    MatchsEvent event,
  ) async* {
    if (event is LoadMatchsEvent) {
      yield* _mapMatchsLoaded();
    }
  }

  Stream<MatchsState> _mapMatchsLoaded() async* {
    try {
      yield (MatchsLoading());
      var matchs = await matchesUseCases.getMatches(id);
      if (matchs?.isEmpty == null) {
        yield (MatchsErros(erros: 'nodata'));
      } else {
        yield (MatchsSuccess(matchs: matchs));
      }
    } on ApiException catch (e) {
      yield MatchsErros(erros: e.errorMessage);
    } catch (_) {
      yield MatchsErros(erros: S.current.connectionProblem);
    }
  }
}
