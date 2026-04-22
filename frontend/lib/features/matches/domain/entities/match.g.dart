// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      matchType: json['matchType'] as String,
      status: json['status'] as String,
      venue: json['venue'] as String,
      date: DateTime.parse(json['date'] as String),
      score: (json['score'] as List<dynamic>?)
              ?.map((e) => TeamScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      teams: json['teams'] as String,
    );

Map<String, dynamic> _$$MatchImplToJson(_$MatchImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'matchType': instance.matchType,
      'status': instance.status,
      'venue': instance.venue,
      'date': instance.date.toIso8601String(),
      'score': instance.score,
      'teams': instance.teams,
    };

_$TeamScoreImpl _$$TeamScoreImplFromJson(Map<String, dynamic> json) =>
    _$TeamScoreImpl(
      r: json['r'] as String,
      w: json['w'] as String,
      o: json['o'] as String,
      inning: json['inning'] as String,
    );

Map<String, dynamic> _$$TeamScoreImplToJson(_$TeamScoreImpl instance) =>
    <String, dynamic>{
      'r': instance.r,
      'w': instance.w,
      'o': instance.o,
      'inning': instance.inning,
    };
