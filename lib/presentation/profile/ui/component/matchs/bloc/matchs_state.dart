part of 'matchs_bloc.dart';

abstract class MatchsState extends Equatable {
  const MatchsState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MatchsInitial extends MatchsState {
  @override
  List<Object> get props => [];
}

class MatchsLoading extends MatchsState {}

class MatchsSuccess extends MatchsState {
  List<Matchs> matchs;

  MatchsSuccess({this.matchs});
  @override
  // TODO: implement props
  List<Object> get props => [matchs];
}

class MatchsErros extends MatchsState {
  String erros;

  MatchsErros({this.erros});
  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
