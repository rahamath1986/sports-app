// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiClientHash() => r'65cbd1f3ca87d60ae6f831848c2d02aec208cda4';

/// See also [apiClient].
@ProviderFor(apiClient)
final apiClientProvider = AutoDisposeProvider<ApiClient>.internal(
  apiClient,
  name: r'apiClientProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$apiClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ApiClientRef = AutoDisposeProviderRef<ApiClient>;
String _$matchRepositoryHash() => r'd073e19907e7a82bcf23ca4db2cefd9065a76551';

/// See also [matchRepository].
@ProviderFor(matchRepository)
final matchRepositoryProvider = AutoDisposeProvider<MatchRepository>.internal(
  matchRepository,
  name: r'matchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$matchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MatchRepositoryRef = AutoDisposeProviderRef<MatchRepository>;
String _$matchInsightsHash() => r'dbf2150e9338972d48d9b26825f98290cd3694e9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [matchInsights].
@ProviderFor(matchInsights)
const matchInsightsProvider = MatchInsightsFamily();

/// See also [matchInsights].
class MatchInsightsFamily extends Family<AsyncValue<MatchInsights>> {
  /// See also [matchInsights].
  const MatchInsightsFamily();

  /// See also [matchInsights].
  MatchInsightsProvider call(
    String matchId,
  ) {
    return MatchInsightsProvider(
      matchId,
    );
  }

  @override
  MatchInsightsProvider getProviderOverride(
    covariant MatchInsightsProvider provider,
  ) {
    return call(
      provider.matchId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'matchInsightsProvider';
}

/// See also [matchInsights].
class MatchInsightsProvider extends AutoDisposeFutureProvider<MatchInsights> {
  /// See also [matchInsights].
  MatchInsightsProvider(
    String matchId,
  ) : this._internal(
          (ref) => matchInsights(
            ref as MatchInsightsRef,
            matchId,
          ),
          from: matchInsightsProvider,
          name: r'matchInsightsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchInsightsHash,
          dependencies: MatchInsightsFamily._dependencies,
          allTransitiveDependencies:
              MatchInsightsFamily._allTransitiveDependencies,
          matchId: matchId,
        );

  MatchInsightsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.matchId,
  }) : super.internal();

  final String matchId;

  @override
  Override overrideWith(
    FutureOr<MatchInsights> Function(MatchInsightsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchInsightsProvider._internal(
        (ref) => create(ref as MatchInsightsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        matchId: matchId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MatchInsights> createElement() {
    return _MatchInsightsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchInsightsProvider && other.matchId == matchId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, matchId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MatchInsightsRef on AutoDisposeFutureProviderRef<MatchInsights> {
  /// The parameter `matchId` of this provider.
  String get matchId;
}

class _MatchInsightsProviderElement
    extends AutoDisposeFutureProviderElement<MatchInsights>
    with MatchInsightsRef {
  _MatchInsightsProviderElement(super.provider);

  @override
  String get matchId => (origin as MatchInsightsProvider).matchId;
}

String _$currentMatchesHash() => r'80ab06789420ea8a5ca51f20eb9868681b91eac3';

/// See also [CurrentMatches].
@ProviderFor(CurrentMatches)
final currentMatchesProvider =
    AutoDisposeAsyncNotifierProvider<CurrentMatches, List<Match>>.internal(
  CurrentMatches.new,
  name: r'currentMatchesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentMatchesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentMatches = AutoDisposeAsyncNotifier<List<Match>>;
String _$matchTypeFilterHash() => r'c1db83b77b8d68d064fad9703f44822ef6c21ca1';

/// See also [MatchTypeFilter].
@ProviderFor(MatchTypeFilter)
final matchTypeFilterProvider =
    AutoDisposeNotifierProvider<MatchTypeFilter, String>.internal(
  MatchTypeFilter.new,
  name: r'matchTypeFilterProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$matchTypeFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MatchTypeFilter = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
