part of 'pro_player_bloc.dart';

abstract class ProPlayerState extends Equatable {
  const ProPlayerState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProPlayerInitial extends ProPlayerState {
  @override
  List<Object> get props => [];
}

class ProPlayerLoading extends ProPlayerState {}

class ProPlayerSuccess extends ProPlayerState {
  List<ProPlayer> proPlayer;

  ProPlayerSuccess({this.proPlayer});
  @override
  // TODO: implement props
  List<Object> get props => [proPlayer];
}

class ProPlayerErros extends ProPlayerState {
  String erros;

  ProPlayerErros({this.erros});
  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
