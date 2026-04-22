import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sports_app/core/network/api_client.dart';
import 'package:sports_app/core/providers/app_state_provider.dart';
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
class CurrentMatches extends _$CurrentMatches {
  Timer? _timer;

  @override
  Future<List<Match>> build() async {
    final isLite = ref.watch(liteModeProvider);
    
    // Schedule background refresh - Conservative intervals to save credits
    // Normal: 5 minutes, Lite Mode: 15 minutes
    _scheduleRefresh(isLite ? 900 : 300);
    
    ref.onDispose(() => _timer?.cancel());

    return ref.watch(matchRepositoryProvider).getCurrentMatches();
  }

  void _scheduleRefresh(int seconds) {
    _timer?.cancel();
    _timer = Timer(Duration(seconds: seconds), () async {
      try {
        // Fetch data silently in background
        final matches = await ref.read(matchRepositoryProvider).getCurrentMatches();
        // Update state directly to AsyncData to avoid UI "refreshing/loading" indicators
        state = AsyncData(matches);
      } catch (e, st) {
        // Silently fail or update with error if critical
        // For polling, we often just keep the previous data
      } finally {
        if (_timer != null) _scheduleRefresh(seconds);
      }
    });
  }
}

@riverpod
Future<MatchInsights> matchInsights(MatchInsightsRef ref, String matchId) {
  return ref.watch(matchRepositoryProvider).getMatchInsights(matchId);
}

// Filter State (Match Type: T20, ODI, etc.)
@riverpod
class MatchTypeFilter extends _$MatchTypeFilter {
  @override
  String build() => 'T20';

  void setFilter(String filter) => state = filter;
}
