import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';
import 'package:flutter_architecture/domain/dota/usecases/player_win_lose_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'profile_win_lose_event.dart';
part 'profile_win_lose_state.dart';

class ProfileWinLoseBloc
    extends Bloc<ProfileWinLoseEvent, ProfileWinLoseState> {
  final PlayerWinLoseUseCases playerWinLoseUseCases;
  final int id;

  ProfileWinLoseBloc({this.playerWinLoseUseCases, this.id})
      : super(ProfileWinLoseInitial());

  @override
  Stream<ProfileWinLoseState> mapEventToState(
    ProfileWinLoseEvent event,
  ) async* {
    if (event is LoadProfileWinLose) {
      yield* _mapPofileWinLoseLoaded();
    }
  }

  Stream<ProfileWinLoseState> _mapPofileWinLoseLoaded() async* {
    try {
      yield (ProfileWinLoseLoading());
      var playerWinLose = await playerWinLoseUseCases.getPlayerWinLose(id);
      if (playerWinLose == null) {
        yield (PrifileWinLoseErros(erros: 'nodata'));
      } else {
        yield (ProfileWinLoseSuccess(playerWinLose: playerWinLose));
      }
    } on ApiException catch (e) {
      yield PrifileWinLoseErros(erros: e.errorMessage);
    } catch (_) {
      yield PrifileWinLoseErros(erros: S.current.connectionProblem);
    }
  }
}
