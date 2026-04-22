import 'package:freezed_annotation/freezed_annotation.dart';

part 'match.freezed.dart';
part 'match.g.dart';

@freezed
class Match with _$Match {
  const factory Match({
    required String id,
    required String name,
    required String matchType,
    required String status,
    required String venue,
    required DateTime date,
    @Default([]) List<TeamScore> score,
    required String teams,
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
