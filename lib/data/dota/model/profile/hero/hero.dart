import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hero.g.dart';

@JsonSerializable()
class Hero extends Equatable {
  @JsonKey(name: 'hero_id')
  int heroId;
  @JsonKey(name: 'games')
  int gamesPlayed;
  @JsonKey(name: 'win')
  int gamesWon;

  Hero({this.heroId, this.gamesPlayed, this.gamesWon});
  factory Hero.fromJson(Map<String, dynamic> json) => _$HeroFromJson(json);
  Map<String, dynamic> toJson() => _$HeroToJson(this);

  @override
  List<Object> get props {
    return [heroId, gamesPlayed, gamesWon];
  }
}
