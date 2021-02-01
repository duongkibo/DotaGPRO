import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable()
class Player extends Equatable {
  @JsonKey(name: 'account_id')
  int id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'personaname')
  String personaname;
  @JsonKey(name: 'avatarfull')
  String avatarUrl;

  Player({this.id, this.name, this.personaname, this.avatarUrl});
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);

  @override
  List<Object> get props {
    return [name, personaname, avatarUrl];
  }
}
