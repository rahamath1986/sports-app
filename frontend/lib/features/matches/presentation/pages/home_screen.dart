import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/features/matches/presentation/providers/match_provider.dart';
import 'package:sports_app/core/providers/app_state_provider.dart';
import 'package:sports_app/features/settings/presentation/pages/settings_screen.dart';
import 'package:sports_app/features/profile/presentation/pages/profile_screen.dart';
import 'match_detail_screen.dart';

import 'package:sports_app/features/matches/domain/entities/match.dart' as entity;

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
      ),
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
                    builder: (context) => MatchDetailScreen(match: match)),
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
  final entity.Match match;
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
              Row(
                children: [
                  Text(
                    match.matchType.toUpperCase(),
                    style: GoogleFonts.outfit(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  if (match.fantasyEnabled) ...[
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.amber.withOpacity(0.3)),
                      ),
                      child: Text(
                        'FANTASY',
                        style: GoogleFonts.outfit(
                            color: Colors.amber, fontSize: 8, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ],
              ),
              _StatusBadge(
                isLive: match.matchStarted && !match.matchEnded,
                isUpcoming: !match.matchStarted,
                isFinished: match.matchEnded,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TeamColumn(
                imageUrl: match.team1Image,
                shortName: match.team1Short,
                fullName: match.team1,
                alignLeft: true,
              ),
              Column(
                children: [
                  Text(
                    'VS',
                    style: GoogleFonts.outfit(
                        color: Colors.white24, fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              _TeamColumn(
                imageUrl: match.team2Image,
                shortName: match.team2Short,
                fullName: match.team2,
                alignLeft: false,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (match.team1Score != null || match.team2Score != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          '${match.team1Score ?? "-"}  |  ${match.team2Score ?? "-"}',
                          style: GoogleFonts.outfit(
                              color: Colors.amberAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, color: Colors.white38, size: 12),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            match.venue,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(color: Colors.white38, fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      match.status,
                      style: GoogleFonts.outfit(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamColumn extends StatelessWidget {
  final String? imageUrl;
  final String shortName;
  final String fullName;
  final bool alignLeft;

  const _TeamColumn({
    required this.imageUrl,
    required this.shortName,
    required this.fullName,
    required this.alignLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        if (imageUrl != null) _TeamLogo(imageUrl: imageUrl!),
        const SizedBox(height: 8),
        Text(
          shortName.isEmpty ? fullName : shortName,
          style: GoogleFonts.outfit(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          fullName,
          style: GoogleFonts.outfit(color: Colors.white38, fontSize: 10),
        ),
      ],
    );
  }
}

class _TeamLogo extends StatelessWidget {
  final String imageUrl;
  const _TeamLogo({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          width: 36,
          height: 36,
          fit: BoxFit.contain,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: SizedBox(
                width: 12,
                height: 12,
                child: CircularProgressIndicator(
                  strokeWidth: 1.5,
                  color: Colors.blueAccent,
                ),
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.sports_cricket_outlined,
                color: Colors.white24, size: 20);
          },
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isLive;
  final bool isUpcoming;
  final bool isFinished;

  const _StatusBadge({
    required this.isLive,
    required this.isUpcoming,
    required this.isFinished,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    String text;

    if (isLive) {
      color = Colors.redAccent;
      text = 'LIVE';
    } else if (isUpcoming) {
      color = Colors.greenAccent;
      text = 'UPCOMING';
    } else {
      color = Colors.blueGrey;
      text = 'FINISHED';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isLive) ...[
            const CircleAvatar(radius: 3, backgroundColor: Colors.redAccent),
            const SizedBox(width: 6),
          ],
          Text(
            text,
            style: GoogleFonts.outfit(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
