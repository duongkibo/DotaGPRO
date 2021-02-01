part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  Players players;

  ProfileSuccess({this.players});

  @override
  // TODO: implement props
  List<Object> get props => [players];
}

class ProfileErros extends ProfileState {
  String erros;
  ProfileErros({this.erros});
  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
