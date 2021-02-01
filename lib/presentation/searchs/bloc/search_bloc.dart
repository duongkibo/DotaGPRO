import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/domain/dota/usecases/search_player_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({this.searchPlayerUseCases, this.name}) : super(SearchInitial());
  SearchPlayerUseCases searchPlayerUseCases;
  String name;

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is LoadSearchEvent) {
      yield* _mapSearchLoaded();
    }
  }

  Stream<SearchState> _mapSearchLoaded() async* {
    try {
      yield (SearchLoading());
      var players = await searchPlayerUseCases.searchPlayer(name);
      if (players?.isEmpty == null) {
        yield (SearchErros(erros: 'no user'));
      } else {
        yield (SearchSuccess(player: players));
      }
    } on ApiException catch (e) {
      yield SearchErros(erros: e.errorMessage);
    } catch (_) {
      yield SearchErros(erros: S.current.connectionProblem);
    }
  }
}
