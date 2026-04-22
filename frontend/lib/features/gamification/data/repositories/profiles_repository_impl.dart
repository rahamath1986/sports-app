import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sports_app/features/gamification/domain/repositories/profiles_repository.dart';

class ProfilesRepositoryImpl implements ProfilesRepository {
  final SupabaseClient _client;

  ProfilesRepositoryImpl(this._client);

  @override
  Future<Map<String, dynamic>?> getProfile(String userId) async {
    final response = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();
    return response;
  }

  @override
  Future<void> updatePoints(String userId, int points) async {
    await _client
        .from('profiles')
        .update({'total_points': points})
        .eq('id', userId);
  }

  @override
  Future<void> updateStreak(String userId, int streak) async {
    await _client
        .from('profiles')
        .update({'streak': streak})
        .eq('id', userId);
  }

  @override
  Future<void> updateUsername(String userId, String username) async {
    await _client
        .from('profiles')
        .update({'username': username})
        .eq('id', userId);
  }
}
