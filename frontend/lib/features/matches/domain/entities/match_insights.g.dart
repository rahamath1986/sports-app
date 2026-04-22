// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_insights.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchInsightsImpl _$$MatchInsightsImplFromJson(Map<String, dynamic> json) =>
    _$MatchInsightsImpl(
      winProbabilityTeamA: (json['winProbabilityTeamA'] as num).toDouble(),
      winProbabilityTeamB: (json['winProbabilityTeamB'] as num).toDouble(),
      winInsight: json['winInsight'] as String,
      nextOverPrediction: json['nextOverPrediction'] as String,
      aiCommentary: json['aiCommentary'] as String,
    );

Map<String, dynamic> _$$MatchInsightsImplToJson(_$MatchInsightsImpl instance) =>
    <String, dynamic>{
      'winProbabilityTeamA': instance.winProbabilityTeamA,
      'winProbabilityTeamB': instance.winProbabilityTeamB,
      'winInsight': instance.winInsight,
      'nextOverPrediction': instance.nextOverPrediction,
      'aiCommentary': instance.aiCommentary,
    };
