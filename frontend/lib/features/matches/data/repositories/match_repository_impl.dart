import 'package:sports_app/core/network/api_client.dart';
import 'package:sports_app/features/matches/domain/entities/match.dart';
import 'package:sports_app/features/matches/domain/entities/match_insights.dart';
import 'package:sports_app/features/matches/domain/repositories/match_repository.dart';

class MatchRepositoryImpl implements MatchRepository {
  final ApiClient apiClient;

  MatchRepositoryImpl(this.apiClient);

  @override
  Future<List<Match>> getCurrentMatches() async {
    final response = await apiClient.get('/matches/current');
    final List data = response.data;
    return data.map((e) => Match.fromJson(e)).toList();
  }

  @override
  Future<MatchInsights> getMatchInsights(String matchId) async {
    final response = await apiClient.get('/matches/$matchId/insights');
    return MatchInsights.fromJson(response.data);
  }
}
