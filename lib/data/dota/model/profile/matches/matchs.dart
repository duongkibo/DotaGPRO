import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'matchs.g.dart';

@JsonSerializable()
class Matchs extends Equatable {
  @JsonKey(name: 'match_id')
  int matchId;
  @JsonKey(name: 'hero_id')
  int herId;
  @JsonKey(name: 'player_slot')
  int playerSlot;
  @JsonKey(name: 'skill')
  int skill;
  @JsonKey(name: 'duration')
  int duration;
  @JsonKey(name: 'game_mode')
  int gameMode;
  @JsonKey(name: 'lobby_type')
  int lobbyType;
  @JsonKey(name: 'radiant_win')
  bool isRadiantWin;
  @JsonKey(name: 'start_time')
  int startTime;
  @JsonKey(name: 'kills')
  int kills;
  @JsonKey(name: 'deaths')
  int deaths;
  @JsonKey(name: 'assists')
  int assists;

  Matchs(
      {this.matchId,
      this.herId,
      this.playerSlot,
      this.skill,
      this.duration,
      this.gameMode,
      this.lobbyType,
      this.isRadiantWin,
      this.startTime,
      this.kills,
      this.deaths,
      this.assists});
  factory Matchs.fromJson(Map<String, dynamic> json) => _$MatchsFromJson(json);
  Map<String, dynamic> toJson() => _$MatchsToJson(this);

  @override
  List<Object> get props {
    return [
      matchId,
      herId,
      playerSlot,
      skill,
      duration,
      gameMode,
      lobbyType,
      isRadiantWin,
      startTime,
      kills,
      deaths,
      assists
    ];
  }
}
