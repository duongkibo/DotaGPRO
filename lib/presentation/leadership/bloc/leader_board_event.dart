part of 'leader_board_bloc.dart';

abstract class LeaderBoardEvent extends Equatable {
  const LeaderBoardEvent();
  @override
  List<Object> get props => [];
}

class LoadLeaderBoardEvent extends LeaderBoardEvent {}
