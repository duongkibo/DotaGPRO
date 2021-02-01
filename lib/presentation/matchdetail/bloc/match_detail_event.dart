part of 'match_detail_bloc.dart';

abstract class MatchDetailEvent extends Equatable {
  const MatchDetailEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadMatchDetail extends MatchDetailEvent {}
