import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_insights.freezed.dart';
part 'match_insights.g.dart';

@freezed
class MatchInsights with _$MatchInsights {
  const factory MatchInsights({
    required double winProbabilityTeamA,
    required double winProbabilityTeamB,
    required String winInsight,
    required String nextOverPrediction,
    required String aiCommentary,
  }) = _MatchInsights;

  factory MatchInsights.fromJson(Map<String, dynamic> json) => _$MatchInsightsFromJson(json);
}
