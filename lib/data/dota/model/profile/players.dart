import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:json_annotation/json_annotation.dart';

part 'players.g.dart';

@JsonSerializable()
class Players extends Equatable {
  @JsonKey(name: 'profile')
  Player player;
  @JsonKey(name: 'rank_tier')
  int rankTier;
  @JsonKey(name: 'leaderboard_rank')
  int leaderboardRank;

  Players({this.player, this.rankTier, this.leaderboardRank});
  factory Players.fromJson(Map<String, dynamic> json) =>
      _$PlayersFromJson(json);
  Map<String, dynamic> toJson() => _$PlayersToJson(this);

  @override
  List<Object> get props {
    return [player, rankTier, leaderboardRank];
  }
}
