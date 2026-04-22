// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_insights.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MatchInsights _$MatchInsightsFromJson(Map<String, dynamic> json) {
  return _MatchInsights.fromJson(json);
}

/// @nodoc
mixin _$MatchInsights {
  double get winProbabilityTeamA => throw _privateConstructorUsedError;
  double get winProbabilityTeamB => throw _privateConstructorUsedError;
  String get winInsight => throw _privateConstructorUsedError;
  String get nextOverPrediction => throw _privateConstructorUsedError;
  String get aiCommentary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchInsightsCopyWith<MatchInsights> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchInsightsCopyWith<$Res> {
  factory $MatchInsightsCopyWith(
          MatchInsights value, $Res Function(MatchInsights) then) =
      _$MatchInsightsCopyWithImpl<$Res, MatchInsights>;
  @useResult
  $Res call(
      {double winProbabilityTeamA,
      double winProbabilityTeamB,
      String winInsight,
      String nextOverPrediction,
      String aiCommentary});
}

/// @nodoc
class _$MatchInsightsCopyWithImpl<$Res, $Val extends MatchInsights>
    implements $MatchInsightsCopyWith<$Res> {
  _$MatchInsightsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winProbabilityTeamA = null,
    Object? winProbabilityTeamB = null,
    Object? winInsight = null,
    Object? nextOverPrediction = null,
    Object? aiCommentary = null,
  }) {
    return _then(_value.copyWith(
      winProbabilityTeamA: null == winProbabilityTeamA
          ? _value.winProbabilityTeamA
          : winProbabilityTeamA // ignore: cast_nullable_to_non_nullable
              as double,
      winProbabilityTeamB: null == winProbabilityTeamB
          ? _value.winProbabilityTeamB
          : winProbabilityTeamB // ignore: cast_nullable_to_non_nullable
              as double,
      winInsight: null == winInsight
          ? _value.winInsight
          : winInsight // ignore: cast_nullable_to_non_nullable
              as String,
      nextOverPrediction: null == nextOverPrediction
          ? _value.nextOverPrediction
          : nextOverPrediction // ignore: cast_nullable_to_non_nullable
              as String,
      aiCommentary: null == aiCommentary
          ? _value.aiCommentary
          : aiCommentary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchInsightsImplCopyWith<$Res>
    implements $MatchInsightsCopyWith<$Res> {
  factory _$$MatchInsightsImplCopyWith(
          _$MatchInsightsImpl value, $Res Function(_$MatchInsightsImpl) then) =
      __$$MatchInsightsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double winProbabilityTeamA,
      double winProbabilityTeamB,
      String winInsight,
      String nextOverPrediction,
      String aiCommentary});
}

/// @nodoc
class __$$MatchInsightsImplCopyWithImpl<$Res>
    extends _$MatchInsightsCopyWithImpl<$Res, _$MatchInsightsImpl>
    implements _$$MatchInsightsImplCopyWith<$Res> {
  __$$MatchInsightsImplCopyWithImpl(
      _$MatchInsightsImpl _value, $Res Function(_$MatchInsightsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? winProbabilityTeamA = null,
    Object? winProbabilityTeamB = null,
    Object? winInsight = null,
    Object? nextOverPrediction = null,
    Object? aiCommentary = null,
  }) {
    return _then(_$MatchInsightsImpl(
      winProbabilityTeamA: null == winProbabilityTeamA
          ? _value.winProbabilityTeamA
          : winProbabilityTeamA // ignore: cast_nullable_to_non_nullable
              as double,
      winProbabilityTeamB: null == winProbabilityTeamB
          ? _value.winProbabilityTeamB
          : winProbabilityTeamB // ignore: cast_nullable_to_non_nullable
              as double,
      winInsight: null == winInsight
          ? _value.winInsight
          : winInsight // ignore: cast_nullable_to_non_nullable
              as String,
      nextOverPrediction: null == nextOverPrediction
          ? _value.nextOverPrediction
          : nextOverPrediction // ignore: cast_nullable_to_non_nullable
              as String,
      aiCommentary: null == aiCommentary
          ? _value.aiCommentary
          : aiCommentary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchInsightsImpl implements _MatchInsights {
  const _$MatchInsightsImpl(
      {required this.winProbabilityTeamA,
      required this.winProbabilityTeamB,
      required this.winInsight,
      required this.nextOverPrediction,
      required this.aiCommentary});

  factory _$MatchInsightsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchInsightsImplFromJson(json);

  @override
  final double winProbabilityTeamA;
  @override
  final double winProbabilityTeamB;
  @override
  final String winInsight;
  @override
  final String nextOverPrediction;
  @override
  final String aiCommentary;

  @override
  String toString() {
    return 'MatchInsights(winProbabilityTeamA: $winProbabilityTeamA, winProbabilityTeamB: $winProbabilityTeamB, winInsight: $winInsight, nextOverPrediction: $nextOverPrediction, aiCommentary: $aiCommentary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchInsightsImpl &&
            (identical(other.winProbabilityTeamA, winProbabilityTeamA) ||
                other.winProbabilityTeamA == winProbabilityTeamA) &&
            (identical(other.winProbabilityTeamB, winProbabilityTeamB) ||
                other.winProbabilityTeamB == winProbabilityTeamB) &&
            (identical(other.winInsight, winInsight) ||
                other.winInsight == winInsight) &&
            (identical(other.nextOverPrediction, nextOverPrediction) ||
                other.nextOverPrediction == nextOverPrediction) &&
            (identical(other.aiCommentary, aiCommentary) ||
                other.aiCommentary == aiCommentary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, winProbabilityTeamA,
      winProbabilityTeamB, winInsight, nextOverPrediction, aiCommentary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchInsightsImplCopyWith<_$MatchInsightsImpl> get copyWith =>
      __$$MatchInsightsImplCopyWithImpl<_$MatchInsightsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchInsightsImplToJson(
      this,
    );
  }
}

abstract class _MatchInsights implements MatchInsights {
  const factory _MatchInsights(
      {required final double winProbabilityTeamA,
      required final double winProbabilityTeamB,
      required final String winInsight,
      required final String nextOverPrediction,
      required final String aiCommentary}) = _$MatchInsightsImpl;

  factory _MatchInsights.fromJson(Map<String, dynamic> json) =
      _$MatchInsightsImpl.fromJson;

  @override
  double get winProbabilityTeamA;
  @override
  double get winProbabilityTeamB;
  @override
  String get winInsight;
  @override
  String get nextOverPrediction;
  @override
  String get aiCommentary;
  @override
  @JsonKey(ignore: true)
  _$$MatchInsightsImplCopyWith<_$MatchInsightsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
