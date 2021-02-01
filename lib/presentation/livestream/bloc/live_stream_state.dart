part of 'live_stream_bloc.dart';

abstract class LiveStreamState extends Equatable {
  const LiveStreamState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LiveStreamInitial extends LiveStreamState {
  @override
  List<Object> get props => [];
}

class LiveStreamLoading extends LiveStreamState {}

class LiveStreamSuccess extends LiveStreamState {
  BoxStream boxStream;

  LiveStreamSuccess({this.boxStream});
  @override
  // TODO: implement props
  List<Object> get props => [boxStream];
}

class LiveStreamErros extends LiveStreamState {
  String erros;

  LiveStreamErros({this.erros});
  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
