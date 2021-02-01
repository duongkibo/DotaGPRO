import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'peer.g.dart';

@JsonSerializable()
class Peer extends Equatable {
  @JsonKey(name: 'account_id')
  int peerId;
  @JsonKey(name: 'personaname')
  String personaname;
  @JsonKey(name: 'avatarfull')
  String avatarfull;
  @JsonKey(name: 'with_games')
  int withGames;
  @JsonKey(name: 'with_win')
  int withWin;

  Peer(
      {this.peerId,
      this.personaname,
      this.avatarfull,
      this.withGames,
      this.withWin});
  factory Peer.fromJson(Map<String, dynamic> json) => _$PeerFromJson(json);
  Map<String, dynamic> toJson() => _$PeerToJson(this);

  @override
  List<Object> get props {
    return [peerId, personaname, avatarfull, withGames, withWin];
  }
}
