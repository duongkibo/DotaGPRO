import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/data/dota/model/profile/players.dart';
import 'package:flutter_architecture/domain/dota/usecases/player_profile_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final PlayerProfileUseCases playerProfileUseCases;
  final int id;
  ProfileBloc({this.playerProfileUseCases, this.id}) : super(ProfileInitial());

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is LoadProfileEvent) {
      yield* _mapLoadedProfile();
    }
  }

  Stream<ProfileState> _mapLoadedProfile() async* {
    try {
      yield ProfileLoading();
      var players = await playerProfileUseCases.getPlayerProfile(id);
      if (players == null) {
        yield ProfileErros(erros: 'nodata');
      } else {
        yield ProfileSuccess(players: players);
      }
    } on ApiException catch (e) {
      yield ProfileErros(erros: e.errorMessage);
    } catch (_) {
      yield ProfileErros(erros: S.current.connectionProblem);
    }
  }
}
