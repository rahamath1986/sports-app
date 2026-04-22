import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/features/matches/presentation/providers/match_provider.dart';
import 'package:sports_app/core/providers/app_state_provider.dart';
import 'package:sports_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:sports_app/features/profile/presentation/pages/profile_screen.dart';
import 'match_detail_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchesAsync = ref.watch(currentMatchesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark Navy
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'SPORTS MASTER',
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(liteModeProvider) ? Icons.bolt : Icons.bolt_outlined,
              color:
                  ref.watch(liteModeProvider) ? Colors.amber : Colors.white24,
            ),
            onPressed: () => ref.read(liteModeProvider.notifier).toggle(),
          ),
        ],
      drawer: Drawer(
        backgroundColor: const Color(0xFF0F172A),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blueAccent),
              child: Center(
                child: Text('SPORTS MASTER',
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Profile'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfileScreen())),
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen())),
            ),
          ],
        ),
      ),
      body: matchesAsync.when(
        data: (matches) => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final match = matches[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MatchDetailScreen(matchId: match.id)),
              ),
              child: MatchCard(match: match),
            );
          },
        ),
        loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.blueAccent)),
        error: (err, stack) => Center(
            child: Text('Error: $err',
                style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}

class MatchCard extends StatelessWidget {
  final dynamic match; // Using dynamic for now to simplify
  const MatchCard({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Slate 800
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                match.matchType.toUpperCase(),
                style: GoogleFonts.outfit(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    CircleAvatar(radius: 3, backgroundColor: Colors.redAccent),
                    SizedBox(width: 4),
                    Text('LIVE',
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              if (match.team1Image != null)
                Image.network(match.team1Image!, width: 32, height: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  match.name,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (match.team2Image != null)
                Image.network(match.team2Image!, width: 32, height: 32),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (match.team1Score != null || match.team2Score != null)
                      Text(
                        '${match.team1Score ?? ""} vs ${match.team2Score ?? ""}',
                        style: GoogleFonts.outfit(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    Text(
                      match.status,
                      style: GoogleFonts.outfit(
                          color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white24, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
