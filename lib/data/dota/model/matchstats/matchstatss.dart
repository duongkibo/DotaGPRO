import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/playerstats.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/team.dart';
import 'package:json_annotation/json_annotation.dart';
part 'matchstatss.g.dart';

@JsonSerializable()
class MatchStatss extends Equatable {
  @JsonKey(name: "match_id")
  int matchId = 0;
  @JsonKey(name: "radiant_win")
  bool isRadiantWin = false;
  @JsonKey(name: "dire_score")
  int direScore = 0;
  @JsonKey(name: "radiant_score")
  int radiantScore = 0;
  @JsonKey(name: "skill")
  int skill = 0;
  @JsonKey(name: "game_mode")
  int mode = 0;
  @JsonKey(name: "duration")
  int duration = 0;
  @JsonKey(name: "start_time")
  int startTime = 0;
  @JsonKey(name: "barracks_status_radiant")
  int radiantBarracks = 0;
  @JsonKey(name: "barracks_status_dire")
  int direBarracks = 0;
  @JsonKey(name: "tower_status_radiant")
  int radiantTowers = 0;
  @JsonKey(name: "tower_status_dire")
  int direTowers = 0;
  @JsonKey(name: "radiant_team")
  Team radiantTeam;
  @JsonKey(name: "dire_team")
  Team direTeam;
  @JsonKey(name: "players")
  List<PlayerStats> players;

  MatchStatss(
      {this.matchId,
      this.isRadiantWin,
      this.direScore,
      this.radiantScore,
      this.skill,
      this.mode,
      this.duration,
      this.startTime,
      this.radiantBarracks,
      this.direBarracks,
      this.radiantTowers,
      this.direTowers,
      this.radiantTeam,
      this.direTeam,
      this.players});
  factory MatchStatss.fromJson(Map<String, dynamic> json) =>
      _$MatchStatssFromJson(json);
  Map<String, dynamic> toJson() => _$MatchStatssToJson(this);

  @override
  List<Object> get props {
    return [
      matchId,
      isRadiantWin,
      direScore,
      radiantScore,
      skill,
      mode,
      duration,
      startTime,
      radiantBarracks,
      direBarracks,
      radiantTowers,
      direTowers,
      radiantTeam,
      direTeam,
      players
    ];
  }
}
