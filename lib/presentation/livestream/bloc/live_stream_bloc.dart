import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/common/api_exception.dart';
import 'package:flutter_architecture/data/livestream/model/box_stream.dart';
import 'package:flutter_architecture/domain/livestream/usecases/box_stream_usecases.dart';
import 'package:flutter_architecture/generated/l10n.dart';

part 'live_stream_event.dart';
part 'live_stream_state.dart';

class LiveStreamBloc extends Bloc<LiveStreamEvent, LiveStreamState> {
  final BoxStreamUsecases boxStreamUsecases;
  LiveStreamBloc({this.boxStreamUsecases}) : super(LiveStreamInitial());

  @override
  Stream<LiveStreamState> mapEventToState(
    LiveStreamEvent event,
  ) async* {
    if (event is LoadLiveStreamEvent) {
      yield* _mapLiveStreamLoaded();
    }
  }

  Stream<LiveStreamState> _mapLiveStreamLoaded() async* {
    try {
      yield (LiveStreamLoading());
      var boxStream = await boxStreamUsecases.getLiveStream('dagger');
      if (boxStream.listLiveStream.isEmpty == true) {
        yield (LiveStreamErros(erros: 'nodata'));
      } else {
        yield (LiveStreamSuccess(boxStream: boxStream));
      }
    } on ApiException catch (e) {
      yield LiveStreamErros(erros: e.errorMessage);
    } catch (_) {
      yield LiveStreamErros(erros: S.current.connectionProblem);
    }
  }
}
