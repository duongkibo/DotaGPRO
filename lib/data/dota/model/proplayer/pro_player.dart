import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pro_player.g.dart';

@JsonSerializable()
class ProPlayer extends Equatable {
  @JsonKey(name: 'account_id')
  int accountId;
  @JsonKey(name: 'avatarfull')
  String avatarFull;
  @JsonKey(name: 'personaname')
  String personaname;
  @JsonKey(name: 'team_name')
  String teamName;
  @JsonKey(name: 'loccountrycode')
  String country;

  ProPlayer(
      {this.accountId,
      this.avatarFull,
      this.personaname,
      this.teamName,
      this.country});
  factory ProPlayer.fromJson(Map<String, dynamic> json) =>
      _$ProPlayerFromJson(json);
  Map<String, dynamic> toJson() => _$ProPlayerToJson(this);
  @override
  // TODO: implement props
  List<Object> get props =>
      [accountId, avatarFull, personaname, teamName, country];
}
