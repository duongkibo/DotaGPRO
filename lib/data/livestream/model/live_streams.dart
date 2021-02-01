import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'live_streams.g.dart';

@JsonSerializable()
class LiveStreams extends Equatable {
  @JsonKey(name: 'user_name')
  String userName;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'viewer_count')
  int viewerCount;
  @JsonKey(name: 'thumbnail_url')
  String thumbnailUrl;

  LiveStreams({this.userName, this.title, this.viewerCount, this.thumbnailUrl});
  factory LiveStreams.fromJson(Map<String, dynamic> json) =>
      _$LiveStreamsFromJson(json);
  Map<String, dynamic> toJSon() => _$LiveStreamsToJson(this);
  @override
  // TODO: implement props
  List<Object> get props => [userName, title, viewerCount, thumbnailUrl];
}
