import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:flutter_architecture/data/livestream/model/box_stream.dart';
import 'package:flutter_architecture/domain/dota/usecases/pro_player_usecases.dart';
import 'package:flutter_architecture/domain/livestream/repositories/box_stream_repository.dart';
import 'package:flutter_architecture/domain/livestream/usecases/box_stream_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'pro_player_event.dart';
part 'pro_player_state.dart';

class ProPlayerBloc extends Bloc<ProPlayerEvent, ProPlayerState> {
  ProPlayerUsesCases proPlayerUsesCases;
  ProPlayerBloc({this.proPlayerUsesCases}) : super(ProPlayerInitial());

  @override
  Stream<ProPlayerState> mapEventToState(
    ProPlayerEvent event,
  ) async* {
    if (event is LoadProPlayerEvent) {
      yield* _mapLoadedBoxStream();
    }
  }

  Stream<ProPlayerState> _mapLoadedBoxStream() async* {
    try {
      yield (ProPlayerLoading());
      var proPlayers = await proPlayerUsesCases.getProPlayer();
      if (proPlayers.isEmpty == null) {
        yield (ProPlayerErros(erros: 'nodat'));
      } else {
        yield (ProPlayerSuccess(proPlayer: proPlayers));
      }
    } on ApiException catch (e) {
      yield ProPlayerErros(erros: e.errorMessage);
    } catch (_) {
      yield ProPlayerErros(erros: S.current.connectionProblem);
    }
  }
}
