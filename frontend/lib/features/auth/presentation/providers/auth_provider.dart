import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sports_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:sports_app/features/auth/data/repositories/auth_repository_impl.dart';

part 'auth_provider.g.dart';

@riverpod
SupabaseClient supabaseClient(SupabaseClientRef ref) => Supabase.instance.client;

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImpl(ref.watch(supabaseClientProvider));
}

@riverpod
Stream<AuthState> authStateChange(AuthStateChangeRef ref) {
  return ref.watch(authRepositoryProvider).onAuthStateChange;
}

@riverpod
User? currentUser(CurrentUserRef ref) {
  return ref.watch(authRepositoryProvider).currentUser;
}
