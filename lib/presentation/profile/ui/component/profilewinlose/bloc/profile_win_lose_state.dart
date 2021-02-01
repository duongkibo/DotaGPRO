part of 'profile_win_lose_bloc.dart';

abstract class ProfileWinLoseState extends Equatable {
  const ProfileWinLoseState();
}

class ProfileWinLoseInitial extends ProfileWinLoseState {
  @override
  List<Object> get props => [];
}

class ProfileWinLoseLoading extends ProfileWinLoseState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProfileWinLoseSuccess extends ProfileWinLoseState {
  PlayerWinLose playerWinLose;

  ProfileWinLoseSuccess({this.playerWinLose});

  @override
  // TODO: implement props
  List<Object> get props => [playerWinLose];
}

class PrifileWinLoseErros extends ProfileWinLoseState {
  String erros;

  PrifileWinLoseErros({this.erros});

  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
