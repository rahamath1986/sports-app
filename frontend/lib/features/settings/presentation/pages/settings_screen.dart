import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app/core/providers/app_state_provider.dart';
import 'package:sports_app/features/profile/presentation/pages/profile_screen.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('SETTINGS', style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _SectionTitle(title: 'PREFERENCES'),
          SwitchListTile(
            title: const Text('Lite Mode'),
            subtitle: const Text('Save data and speed up the app'),
            value: ref.watch(liteModeProvider),
            onChanged: (val) => ref.read(liteModeProvider.notifier).toggle(),
            activeColor: Colors.amber,
          ),
          SwitchListTile(
            title: const Text('AI Commentary'),
            subtitle: const Text('Listen to live match updates'),
            value: ref.watch(voiceEnabledProvider),
            onChanged: (val) => ref.read(voiceEnabledProvider.notifier).toggle(),
            activeColor: Colors.blueAccent,
          ),
          const SizedBox(height: 32),
          _SectionTitle(title: 'ACCOUNT'),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('View Profile'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen())),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        title,
        style: GoogleFonts.outfit(color: Colors.blueAccent, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1),
      ),
    );
  }
}
