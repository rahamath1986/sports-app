import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sports_app/core/network/api_client.dart';
import 'package:sports_app/features/matches/data/repositories/match_repository_impl.dart';
import 'package:sports_app/features/matches/domain/entities/match.dart';
import 'package:sports_app/features/matches/domain/entities/match_insights.dart';
import 'package:sports_app/features/matches/domain/repositories/match_repository.dart';

part 'match_provider.g.dart';

@riverpod
ApiClient apiClient(ApiClientRef ref) => ApiClient();

@riverpod
MatchRepository matchRepository(MatchRepositoryRef ref) {
  final client = ref.watch(apiClientProvider);
  return MatchRepositoryImpl(client);
}

@riverpod
Future<List<Match>> currentMatches(CurrentMatchesRef ref) {
  return ref.watch(matchRepositoryProvider).getCurrentMatches();
}

@riverpod
Future<MatchInsights> matchInsights(MatchInsightsRef ref, String matchId) {
  return ref.watch(matchRepositoryProvider).getMatchInsights(matchId);
}
