part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchSuccess extends SearchState {
  List<Player> player;

  SearchSuccess({this.player});

  @override
  // TODO: implement props
  List<Object> get props => [player];
}

class SearchErros extends SearchState {
  String erros;

  SearchErros({this.erros});

  @override
  // TODO: implement props
  List<Object> get props => [erros];
}
