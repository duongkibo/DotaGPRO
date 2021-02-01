part of 'leader_board_bloc.dart';

abstract class LeaderBoardState extends Equatable {
  const LeaderBoardState();
}

class LeaderBoardInitial extends LeaderBoardState {
  @override
  List<Object> get props => [];
}

class LeadBoardLoading extends LeaderBoardState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LeaderBoardSuccess extends LeaderBoardState {
  final List<Competitive> competitive;

  LeaderBoardSuccess({this.competitive});

  @override
  List<Object> get props => [competitive];
}

class LeaderBoardErros extends LeaderBoardState {
  String erros;
  LeaderBoardErros({this.erros});

  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
