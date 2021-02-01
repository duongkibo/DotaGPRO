part of 'matchs_bloc.dart';

abstract class MatchsEvent extends Equatable {
  const MatchsEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadMatchsEvent extends MatchsEvent {}
