import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'playerstats.g.dart';

@JsonSerializable()
class PlayerStats extends Equatable {
  @JsonKey(name: 'account_id')
  int id;
  @JsonKey(name: 'match_id')
  int matchId;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'personaname')
  String personaName;
  @JsonKey(name: 'player_slot')
  int playerSlot;
  @JsonKey(name: 'assists')
  int assists;
  @JsonKey(name: 'backpack_0')
  int backpack0;
  @JsonKey(name: 'backpack_1')
  int backpack1;
  @JsonKey(name: 'backpack_2')
  int backpack2;
  @JsonKey(name: 'deaths')
  int deaths;
  @JsonKey(name: 'denies')
  int denies;
  @JsonKey(name: 'gold_per_min')
  int goldPerMin;
  @JsonKey(name: 'hero_damage')
  int heroDamage;
  @JsonKey(name: 'hero_healing')
  int heroHealing;
  @JsonKey(name: 'hero_id')
  int heroId;
  @JsonKey(name: 'item_0')
  int item0;
  @JsonKey(name: 'item_1')
  int item1;
  @JsonKey(name: 'item_2')
  int item2;
  @JsonKey(name: 'item_3')
  int item3;
  @JsonKey(name: 'item_4')
  int item4;
  @JsonKey(name: 'item_5')
  int item5;
  @JsonKey(name: 'item_neutral')
  int itemNeutral;
  @JsonKey(name: 'kills')
  int kills;
  @JsonKey(name: 'last_hits')
  int lastHits;
  @JsonKey(name: 'level')
  int level;
  @JsonKey(name: 'tower_damage')
  int towerDamage;
  @JsonKey(name: 'xp_per_min')
  int xpPerMin;
  @JsonKey(name: 'purchase_ward_observer')
  int purchaseWardObserver = 0;
  @JsonKey(name: 'purchase_ward_sentry')
  int purchaseWardSentry = 0;
  @JsonKey(name: 'isRadiant')
  bool isRadiant;
  @JsonKey(name: 'total_gold')
  int totalGold;

  PlayerStats(
      {this.id,
      this.matchId,
      this.name,
      this.personaName,
      this.playerSlot,
      this.assists,
      this.backpack0,
      this.backpack1,
      this.backpack2,
      this.deaths,
      this.denies,
      this.goldPerMin,
      this.heroDamage,
      this.heroHealing,
      this.heroId,
      this.item0,
      this.item1,
      this.item2,
      this.item3,
      this.item4,
      this.item5,
      this.itemNeutral,
      this.kills,
      this.lastHits,
      this.level,
      this.towerDamage,
      this.xpPerMin,
      this.purchaseWardObserver,
      this.purchaseWardSentry,
      this.isRadiant,
      this.totalGold});
  factory PlayerStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerStatsFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerStatsToJson(this);

  @override
  List<Object> get props {
    return [
      id,
      matchId,
      name,
      personaName,
      playerSlot,
      assists,
      backpack0,
      backpack1,
      backpack2,
      deaths,
      denies,
      goldPerMin,
      heroDamage,
      heroHealing,
      heroId,
      item0,
      item1,
      item2,
      item3,
      item4,
      item5,
      itemNeutral,
      kills,
      lastHits,
      level,
      towerDamage,
      xpPerMin,
      purchaseWardObserver,
      purchaseWardSentry,
      isRadiant,
      totalGold
    ];
  }
}
