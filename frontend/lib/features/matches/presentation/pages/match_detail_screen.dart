import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/features/matches/presentation/providers/match_provider.dart';
import 'package:sports_app/core/providers/app_state_provider.dart';
import 'package:sports_app/core/services/voice_service.dart';

import 'package:sports_app/features/matches/domain/entities/match.dart' as entity;

class MatchDetailScreen extends ConsumerWidget {
  final entity.Match match;
  const MatchDetailScreen({super.key, required this.match});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insightsAsync = ref.watch(matchInsightsProvider(match.id));
    final isLiteMode = ref.watch(liteModeProvider);
    final isVoiceEnabled = ref.watch(voiceEnabledProvider);
    final voiceService = VoiceService();

    // Trigger voice when insights change
    ref.listen(matchInsightsProvider(match.id), (previous, next) {
      if (isVoiceEnabled && next.hasValue) {
        voiceService.speak(next.value!.aiCommentary);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('${match.team1Short} vs ${match.team2Short}',
            style: GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AI Insights Section
            insightsAsync.when(
              data: (insights) => Column(
                children: [
                  WinProbabilitySection(match: match, insights: insights),
                  const SizedBox(height: 24),
                  AiCommentaryPanel(commentary: insights.aiCommentary),
                  const SizedBox(height: 24),
                  if (!isLiteMode) PredictionPanel(),
                ],
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Error loading insights: $e')),
            ),
          ],
        ),
      ),
    );
  }
}

class WinProbabilitySection extends StatelessWidget {
  final dynamic insights;
  final entity.Match match;
  const WinProbabilitySection({super.key, required this.match, required this.insights});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.withOpacity(0.1), Colors.purple.withOpacity(0.1)],
        ),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Text('WIN PROBABILITY', style: GoogleFonts.outfit(color: Colors.white70, letterSpacing: 2, fontSize: 12)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _ProbIndicator(label: match.team1Short.isEmpty ? match.team1.toUpperCase() : match.team1Short, prob: insights.winProbabilityTeamA, color: Colors.blueAccent),
              _ProbIndicator(label: match.team2Short.isEmpty ? match.team2.toUpperCase() : match.team2Short, prob: insights.winProbabilityTeamB, color: Colors.purpleAccent),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            insights.winInsight,
            textAlign: TextAlign.center,
            style: GoogleFonts.outfit(color: Colors.amberAccent, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _ProbIndicator extends StatelessWidget {
  final String label;
  final double prob;
  final Color color;
  const _ProbIndicator({required this.label, required this.prob, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${prob.toInt()}%', style: GoogleFonts.outfit(color: color, fontSize: 32, fontWeight: FontWeight.bold)),
        Text(label, style: GoogleFonts.outfit(color: Colors.white38, fontSize: 10)),
      ],
    );
  }
}

class AiCommentaryPanel extends StatelessWidget {
  final String commentary;
  const AiCommentaryPanel({super.key, required this.commentary});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Icon(Icons.psychology, color: Colors.blueAccent, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AI ENHANCED INSIGHT', style: GoogleFonts.outfit(color: Colors.blueAccent, fontSize: 10, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(commentary, style: GoogleFonts.outfit(color: Colors.white, fontSize: 15, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PredictionPanel extends StatefulWidget {
  @override
  _PredictionPanelState createState() => _PredictionPanelState();
}

class _PredictionPanelState extends State<PredictionPanel> {
  bool isLocked = false;
  int timer = 5; // Lag-aware buffer

  void startCountdown() async {
    for (int i = 5; i >= 0; i--) {
      if (!mounted) return;
      setState(() => timer = i);
      await Future.delayed(const Duration(seconds: 1));
    }
    if (mounted) setState(() => isLocked = true);
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.05),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.amber.withOpacity(0.2)),
        boxShadow: [
          if (!isLocked)
            BoxShadow(color: Colors.amber.withOpacity(0.1), blurRadius: 20, spreadRadius: -5),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PREDICT NEXT BALL',
                  style: GoogleFonts.outfit(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 12)),
              if (!isLocked)
                Text('LOCKING IN ${timer}S',
                    style: GoogleFonts.outfit(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _PredictionTile(label: 'DOT', icon: Icons.circle_outlined, isLocked: isLocked),
              _PredictionTile(label: '1-3', icon: Icons.run_circle_outlined, isLocked: isLocked),
              _PredictionTile(label: '4/6', icon: Icons.bolt, isLocked: isLocked),
              _PredictionTile(label: 'WK', icon: Icons.scuba_diving, isLocked: isLocked),
            ],
          ),
          if (isLocked) ...[
            const SizedBox(height: 16),
            Text('PREDICTIONS LOCKED',
                style: GoogleFonts.outfit(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold)),
          ]
        ],
      ),
    );
  }
}

class _PredictionTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isLocked;
  const _PredictionTile({required this.label, required this.icon, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isLocked ? 0.3 : 1.0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white10),
            ),
            child: Icon(icon, color: Colors.amber),
          ),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.outfit(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
