// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectivityHash() => r'f18900083489763ed4066a1c33ea0447ca0093fc';

/// See also [connectivity].
@ProviderFor(connectivity)
final connectivityProvider =
    AutoDisposeStreamProvider<List<ConnectivityResult>>.internal(
  connectivity,
  name: r'connectivityProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$connectivityHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConnectivityRef
    = AutoDisposeStreamProviderRef<List<ConnectivityResult>>;
String _$liteModeHash() => r'c7c8c527aa8a30e5cc89cc0df3e6f9832de2d087';

/// See also [LiteMode].
@ProviderFor(LiteMode)
final liteModeProvider = AutoDisposeNotifierProvider<LiteMode, bool>.internal(
  LiteMode.new,
  name: r'liteModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$liteModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LiteMode = AutoDisposeNotifier<bool>;
String _$voiceEnabledHash() => r'25a91159e5f25d07422cf66b4fbca6990b82727b';

/// See also [VoiceEnabled].
@ProviderFor(VoiceEnabled)
final voiceEnabledProvider =
    AutoDisposeNotifierProvider<VoiceEnabled, bool>.internal(
  VoiceEnabled.new,
  name: r'voiceEnabledProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$voiceEnabledHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VoiceEnabled = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
