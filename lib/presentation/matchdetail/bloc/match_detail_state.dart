part of 'match_detail_bloc.dart';

abstract class MatchDetailState extends Equatable {
  const MatchDetailState();
}

class MatchDetailInitial extends MatchDetailState {
  @override
  List<Object> get props => [];
}

class MatchDetailLoading extends MatchDetailState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MatchDetailSuccess extends MatchDetailState {
  final MatchStatss matchStatss;

  MatchDetailSuccess({this.matchStatss});

  @override
  List<Object> get props => [matchStatss];
}

class MatchDetaildErros extends MatchDetailState {
  String erros;
  MatchDetaildErros({this.erros});

  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
