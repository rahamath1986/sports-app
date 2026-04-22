import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'app_state_provider.g.dart';

@riverpod
class LiteMode extends _$LiteMode {
  @override
  bool build() {
    // Basic auto-detection logic could go here
    return false;
  }

  void toggle() => state = !state;
}

@riverpod
class VoiceEnabled extends _$VoiceEnabled {
  @override
  bool build() => true;

  void toggle() => state = !state;
}

@riverpod
Stream<List<ConnectivityResult>> connectivity(ConnectivityRef ref) {
  return Connectivity().onConnectivityChanged;
}
