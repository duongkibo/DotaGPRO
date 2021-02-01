import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'competitive.g.dart';

@JsonSerializable()
class Competitive extends Equatable {
  @JsonKey(name: "match_id")
  int matchId;
  @JsonKey(name: "start_time")
  int startTime;
  @JsonKey(name: "duration")
  int duration;
  @JsonKey(name: "radiant_name")
  String radiantName;
  @JsonKey(name: "dire_name")
  String direName;
  @JsonKey(name: "league_name")
  String leagueName;
  @JsonKey(name: "radiant_score")
  int radiantScore;
  @JsonKey(name: "dire_score")
  int direScore;
  @JsonKey(name: "radiant_win")
  bool isRadiantWin;

  Competitive(
      {this.matchId,
      this.startTime,
      this.duration,
      this.radiantName,
      this.direName,
      this.leagueName,
      this.radiantScore,
      this.direScore,
      this.isRadiantWin});
  factory Competitive.fromJson(Map<String, dynamic> json) =>
      _$CompetitiveFromJson(json);
  Map<String, dynamic> toJson() => _$CompetitiveToJson(this);

  @override
  List<Object> get props {
    return [
      matchId,
      startTime,
      duration,
      radiantName,
      leagueName,
      radiantScore,
      direScore,
      isRadiantWin
    ];
  }
}
