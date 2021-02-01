part of 'profile_win_lose_bloc.dart';

abstract class ProfileWinLoseEvent extends Equatable {
  const ProfileWinLoseEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadProfileWinLose extends ProfileWinLoseEvent {}
