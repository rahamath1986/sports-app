import '../entities/match.dart';
import '../entities/match_insights.dart';

abstract class MatchRepository {
  Future<List<Match>> getCurrentMatches();
  Future<MatchInsights> getMatchInsights(String matchId);
}
