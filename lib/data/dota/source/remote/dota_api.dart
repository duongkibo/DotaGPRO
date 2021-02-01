import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/dota/model/competitive/competitive.dart';
import 'package:flutter_architecture/data/dota/model/matchstats/matchstatss.dart';
import 'package:flutter_architecture/data/dota/model/profile/hero/hero.dart';
import 'package:flutter_architecture/data/dota/model/profile/matches/matchs.dart';
import 'package:flutter_architecture/data/dota/model/profile/peer/peer.dart';
import 'package:flutter_architecture/data/dota/model/profile/player/player.dart';
import 'package:flutter_architecture/data/dota/model/profile/players.dart';
import 'package:flutter_architecture/data/dota/model/profile/playerwinlose/player_win_lose.dart';
import 'package:flutter_architecture/data/dota/model/proplayer/pro_player.dart';
import 'package:retrofit/http.dart';

part 'dota_api.g.dart';

@RestApi(baseUrl: 'https://api.opendota.com/api/')
abstract class DotaApi {
  factory DotaApi(Dio dio, {String baseUrl}) = _DotaApi;
  @GET('search')
  Future<List<Player>> searchPlayer(@Query('q') String name);
  @GET('players/{account_id}')
  Future<Players> getPlayerProfile(@Path('account_id') int id);
  @GET('players/{account_id}/wl')
  Future<PlayerWinLose> getPlayerWinLose(@Path('account_id') int playerId);
  @GET('players/{account_id}/matches?significant=0%/20/0')
  Future<List<Matchs>> getMatches(@Path('account_id') int playerId);
  @GET('players/{account_id}/matches?significant=0%/20/0')
  Future<List<Matchs>> getMatchesByHero(
      @Path('account_id') int playerId,
      @Query('hero_id') int heroId,
      @Query('limit') int limit,
      @Query('offset') int offset);
  @GET('players/{account_id}/heroes')
  Future<List<Hero>> getHeroes(@Path('account_id') int playerId);
  @GET('players/{account_id}/peers')
  Future<List<Peer>> getPeers(@Path('account_id') int playerId);
  @GET('matches/{match_id}/')
  Future<MatchStatss> getMatch(@Path('match_id') int matchId);
  @GET('proMatches')
  Future<List<Competitive>> getCompetitive();
  @GET('proPlayers')
  Future<List<ProPlayer>> getProPlayer();
}
