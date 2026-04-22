abstract class ProfilesRepository {
  Future<Map<String, dynamic>?> getProfile(String userId);
  Future<void> updatePoints(String userId, int points);
  Future<void> updateStreak(String userId, int streak);
  Future<void> updateUsername(String userId, String username);
}
