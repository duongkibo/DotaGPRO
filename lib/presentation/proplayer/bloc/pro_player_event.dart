part of 'pro_player_bloc.dart';

abstract class ProPlayerEvent extends Equatable {
  const ProPlayerEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadProPlayerEvent extends ProPlayerEvent {}
