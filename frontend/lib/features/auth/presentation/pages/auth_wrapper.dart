import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:sports_app/features/matches/presentation/pages/home_screen.dart';
import 'package:sports_app/features/auth/presentation/pages/login_screen.dart';

class AuthWrapper extends ConsumerWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateChangeProvider);

    return authState.when(
      data: (state) {
        final session = state.session;
        if (session != null) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, s) => Scaffold(body: Center(child: Text('Auth Error: $e'))),
    );
  }
}
