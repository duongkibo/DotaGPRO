import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player_win_lose.g.dart';

@JsonSerializable()
class PlayerWinLose extends Equatable {
  @JsonKey(name: 'win')
  int win;
  @JsonKey(name: 'lose')
  int lose;

  PlayerWinLose({this.win, this.lose});
  factory PlayerWinLose.fromJson(Map<String, dynamic> json) =>
      _$PlayerWinLoseFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerWinLoseToJson(this);

  @override
  List<Object> get props {
    return [win, lose];
  }
}
