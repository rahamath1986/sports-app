// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchImpl _$$MatchImplFromJson(Map<String, dynamic> json) => _$MatchImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      matchType: json['matchType'] as String? ?? '',
      status: json['status'] as String? ?? '',
      venue: json['venue'] as String? ?? '',
      date: DateTime.parse(json['date'] as String),
      score: (json['score'] as List<dynamic>?)
              ?.map((e) => TeamScore.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      teams: json['teams'] as String? ?? '',
      team1: json['team1'] as String? ?? '',
      team2: json['team2'] as String? ?? '',
      team1Short: json['team1Short'] as String? ?? '',
      team2Short: json['team2Short'] as String? ?? '',
      fantasyEnabled: json['fantasyEnabled'] as bool? ?? false,
      matchStarted: json['matchStarted'] as bool? ?? false,
      matchEnded: json['matchEnded'] as bool? ?? false,
      team1Image: json['team1Image'] as String?,
      team2Image: json['team2Image'] as String?,
      team1Score: json['team1Score'] as String?,
      team2Score: json['team2Score'] as String?,
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
      'team1': instance.team1,
      'team2': instance.team2,
      'team1Short': instance.team1Short,
      'team2Short': instance.team2Short,
      'fantasyEnabled': instance.fantasyEnabled,
      'matchStarted': instance.matchStarted,
      'matchEnded': instance.matchEnded,
      'team1Image': instance.team1Image,
      'team2Image': instance.team2Image,
      'team1Score': instance.team1Score,
      'team2Score': instance.team2Score,
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
