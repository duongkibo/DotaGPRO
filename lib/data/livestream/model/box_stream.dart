import 'package:equatable/equatable.dart';
import 'package:flutter_architecture/data/livestream//model/live_streams.dart';
import 'package:json_annotation/json_annotation.dart';

part 'box_stream.g.dart';

@JsonSerializable()
class BoxStream extends Equatable {
  @JsonKey(name: 'data')
  List<LiveStreams> listLiveStream;

  BoxStream({this.listLiveStream});
  factory BoxStream.fromJson(Map<String, dynamic> json) =>
      _$BoxStreamFromJson(json);
  Map<String, dynamic> toJSon() => _$BoxStreamToJson(this);
  @override
  // TODO: implement props
  List<Object> get props => [listLiveStream];
}
