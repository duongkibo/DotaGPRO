part of 'live_stream_bloc.dart';

abstract class LiveStreamEvent extends Equatable {
  const LiveStreamEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadLiveStreamEvent extends LiveStreamEvent {}
