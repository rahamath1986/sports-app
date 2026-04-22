import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    @Default('') String name,
    @Default('') String matchType,
    @Default('') String status,
    @Default('') String venue,
    required DateTime date,
    @Default([]) List<TeamScore> score,
    @Default('') String teams,
    @Default('') String team1,
    @Default('') String team2,
    @Default('') String team1Short,
    @Default('') String team2Short,
    @Default(false) bool fantasyEnabled,
    @Default(false) bool matchStarted,
    @Default(false) bool matchEnded,
    String? team1Image,
    String? team2Image,
    String? team1Score,
    String? team2Score,
  }) = _Match;

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

@freezed
class TeamScore with _$TeamScore {
  const factory TeamScore({
    required String r,
    required String w,
    required String o,
    required String inning,
  }) = _TeamScore;

  factory TeamScore.fromJson(Map<String, dynamic> json) => _$TeamScoreFromJson(json);
}
