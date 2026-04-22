// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Match _$MatchFromJson(Map<String, dynamic> json) {
  return _Match.fromJson(json);
}

/// @nodoc
mixin _$Match {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get matchType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get venue => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<TeamScore> get score => throw _privateConstructorUsedError;
  String get teams => throw _privateConstructorUsedError;
  String get team1 => throw _privateConstructorUsedError;
  String get team2 => throw _privateConstructorUsedError;
  String get team1Short => throw _privateConstructorUsedError;
  String get team2Short => throw _privateConstructorUsedError;
  String get series => throw _privateConstructorUsedError;
  bool get fantasyEnabled => throw _privateConstructorUsedError;
  bool get matchStarted => throw _privateConstructorUsedError;
  bool get matchEnded => throw _privateConstructorUsedError;
  String? get team1Image => throw _privateConstructorUsedError;
  String? get team2Image => throw _privateConstructorUsedError;
  String? get team1Score => throw _privateConstructorUsedError;
  String? get team2Score => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCopyWith<Match> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCopyWith<$Res> {
  factory $MatchCopyWith(Match value, $Res Function(Match) then) =
      _$MatchCopyWithImpl<$Res, Match>;
  @useResult
  $Res call(
      {String id,
      String name,
      String matchType,
      String status,
      String venue,
      DateTime date,
      List<TeamScore> score,
      String teams,
      String team1,
      String team2,
      String team1Short,
      String team2Short,
      String series,
      bool fantasyEnabled,
      bool matchStarted,
      bool matchEnded,
      String? team1Image,
      String? team2Image,
      String? team1Score,
      String? team2Score});
}

/// @nodoc
class _$MatchCopyWithImpl<$Res, $Val extends Match>
    implements $MatchCopyWith<$Res> {
  _$MatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? matchType = null,
    Object? status = null,
    Object? venue = null,
    Object? date = null,
    Object? score = null,
    Object? teams = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? team1Short = null,
    Object? team2Short = null,
    Object? series = null,
    Object? fantasyEnabled = null,
    Object? matchStarted = null,
    Object? matchEnded = null,
    Object? team1Image = freezed,
    Object? team2Image = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as List<TeamScore>,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as String,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as String,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as String,
      team1Short: null == team1Short
          ? _value.team1Short
          : team1Short // ignore: cast_nullable_to_non_nullable
              as String,
      team2Short: null == team2Short
          ? _value.team2Short
          : team2Short // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String,
      fantasyEnabled: null == fantasyEnabled
          ? _value.fantasyEnabled
          : fantasyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      matchStarted: null == matchStarted
          ? _value.matchStarted
          : matchStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      matchEnded: null == matchEnded
          ? _value.matchEnded
          : matchEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      team1Image: freezed == team1Image
          ? _value.team1Image
          : team1Image // ignore: cast_nullable_to_non_nullable
              as String?,
      team2Image: freezed == team2Image
          ? _value.team2Image
          : team2Image // ignore: cast_nullable_to_non_nullable
              as String?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as String?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchImplCopyWith<$Res> implements $MatchCopyWith<$Res> {
  factory _$$MatchImplCopyWith(
          _$MatchImpl value, $Res Function(_$MatchImpl) then) =
      __$$MatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String matchType,
      String status,
      String venue,
      DateTime date,
      List<TeamScore> score,
      String teams,
      String team1,
      String team2,
      String team1Short,
      String team2Short,
      String series,
      bool fantasyEnabled,
      bool matchStarted,
      bool matchEnded,
      String? team1Image,
      String? team2Image,
      String? team1Score,
      String? team2Score});
}

/// @nodoc
class __$$MatchImplCopyWithImpl<$Res>
    extends _$MatchCopyWithImpl<$Res, _$MatchImpl>
    implements _$$MatchImplCopyWith<$Res> {
  __$$MatchImplCopyWithImpl(
      _$MatchImpl _value, $Res Function(_$MatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? matchType = null,
    Object? status = null,
    Object? venue = null,
    Object? date = null,
    Object? score = null,
    Object? teams = null,
    Object? team1 = null,
    Object? team2 = null,
    Object? team1Short = null,
    Object? team2Short = null,
    Object? series = null,
    Object? fantasyEnabled = null,
    Object? matchStarted = null,
    Object? matchEnded = null,
    Object? team1Image = freezed,
    Object? team2Image = freezed,
    Object? team1Score = freezed,
    Object? team2Score = freezed,
  }) {
    return _then(_$MatchImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      matchType: null == matchType
          ? _value.matchType
          : matchType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      venue: null == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      score: null == score
          ? _value._score
          : score // ignore: cast_nullable_to_non_nullable
              as List<TeamScore>,
      teams: null == teams
          ? _value.teams
          : teams // ignore: cast_nullable_to_non_nullable
              as String,
      team1: null == team1
          ? _value.team1
          : team1 // ignore: cast_nullable_to_non_nullable
              as String,
      team2: null == team2
          ? _value.team2
          : team2 // ignore: cast_nullable_to_non_nullable
              as String,
      team1Short: null == team1Short
          ? _value.team1Short
          : team1Short // ignore: cast_nullable_to_non_nullable
              as String,
      team2Short: null == team2Short
          ? _value.team2Short
          : team2Short // ignore: cast_nullable_to_non_nullable
              as String,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as String,
      fantasyEnabled: null == fantasyEnabled
          ? _value.fantasyEnabled
          : fantasyEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      matchStarted: null == matchStarted
          ? _value.matchStarted
          : matchStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      matchEnded: null == matchEnded
          ? _value.matchEnded
          : matchEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      team1Image: freezed == team1Image
          ? _value.team1Image
          : team1Image // ignore: cast_nullable_to_non_nullable
              as String?,
      team2Image: freezed == team2Image
          ? _value.team2Image
          : team2Image // ignore: cast_nullable_to_non_nullable
              as String?,
      team1Score: freezed == team1Score
          ? _value.team1Score
          : team1Score // ignore: cast_nullable_to_non_nullable
              as String?,
      team2Score: freezed == team2Score
          ? _value.team2Score
          : team2Score // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchImpl implements _Match {
  const _$MatchImpl(
      {required this.id,
      this.name = '',
      this.matchType = '',
      this.status = '',
      this.venue = '',
      required this.date,
      final List<TeamScore> score = const [],
      this.teams = '',
      this.team1 = '',
      this.team2 = '',
      this.team1Short = '',
      this.team2Short = '',
      this.series = '',
      this.fantasyEnabled = false,
      this.matchStarted = false,
      this.matchEnded = false,
      this.team1Image,
      this.team2Image,
      this.team1Score,
      this.team2Score})
      : _score = score;

  factory _$MatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String matchType;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String venue;
  @override
  final DateTime date;
  final List<TeamScore> _score;
  @override
  @JsonKey()
  List<TeamScore> get score {
    if (_score is EqualUnmodifiableListView) return _score;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_score);
  }

  @override
  @JsonKey()
  final String teams;
  @override
  @JsonKey()
  final String team1;
  @override
  @JsonKey()
  final String team2;
  @override
  @JsonKey()
  final String team1Short;
  @override
  @JsonKey()
  final String team2Short;
  @override
  @JsonKey()
  final String series;
  @override
  @JsonKey()
  final bool fantasyEnabled;
  @override
  @JsonKey()
  final bool matchStarted;
  @override
  @JsonKey()
  final bool matchEnded;
  @override
  final String? team1Image;
  @override
  final String? team2Image;
  @override
  final String? team1Score;
  @override
  final String? team2Score;

  @override
  String toString() {
    return 'Match(id: $id, name: $name, matchType: $matchType, status: $status, venue: $venue, date: $date, score: $score, teams: $teams, team1: $team1, team2: $team2, team1Short: $team1Short, team2Short: $team2Short, series: $series, fantasyEnabled: $fantasyEnabled, matchStarted: $matchStarted, matchEnded: $matchEnded, team1Image: $team1Image, team2Image: $team2Image, team1Score: $team1Score, team2Score: $team2Score)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.matchType, matchType) ||
                other.matchType == matchType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._score, _score) &&
            (identical(other.teams, teams) || other.teams == teams) &&
            (identical(other.team1, team1) || other.team1 == team1) &&
            (identical(other.team2, team2) || other.team2 == team2) &&
            (identical(other.team1Short, team1Short) ||
                other.team1Short == team1Short) &&
            (identical(other.team2Short, team2Short) ||
                other.team2Short == team2Short) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.fantasyEnabled, fantasyEnabled) ||
                other.fantasyEnabled == fantasyEnabled) &&
            (identical(other.matchStarted, matchStarted) ||
                other.matchStarted == matchStarted) &&
            (identical(other.matchEnded, matchEnded) ||
                other.matchEnded == matchEnded) &&
            (identical(other.team1Image, team1Image) ||
                other.team1Image == team1Image) &&
            (identical(other.team2Image, team2Image) ||
                other.team2Image == team2Image) &&
            (identical(other.team1Score, team1Score) ||
                other.team1Score == team1Score) &&
            (identical(other.team2Score, team2Score) ||
                other.team2Score == team2Score));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        matchType,
        status,
        venue,
        date,
        const DeepCollectionEquality().hash(_score),
        teams,
        team1,
        team2,
        team1Short,
        team2Short,
        series,
        fantasyEnabled,
        matchStarted,
        matchEnded,
        team1Image,
        team2Image,
        team1Score,
        team2Score
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      __$$MatchImplCopyWithImpl<_$MatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchImplToJson(
      this,
    );
  }
}

abstract class _Match implements Match {
  const factory _Match(
      {required final String id,
      final String name,
      final String matchType,
      final String status,
      final String venue,
      required final DateTime date,
      final List<TeamScore> score,
      final String teams,
      final String team1,
      final String team2,
      final String team1Short,
      final String team2Short,
      final String series,
      final bool fantasyEnabled,
      final bool matchStarted,
      final bool matchEnded,
      final String? team1Image,
      final String? team2Image,
      final String? team1Score,
      final String? team2Score}) = _$MatchImpl;

  factory _Match.fromJson(Map<String, dynamic> json) = _$MatchImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get matchType;
  @override
  String get status;
  @override
  String get venue;
  @override
  DateTime get date;
  @override
  List<TeamScore> get score;
  @override
  String get teams;
  @override
  String get team1;
  @override
  String get team2;
  @override
  String get team1Short;
  @override
  String get team2Short;
  @override
  String get series;
  @override
  bool get fantasyEnabled;
  @override
  bool get matchStarted;
  @override
  bool get matchEnded;
  @override
  String? get team1Image;
  @override
  String? get team2Image;
  @override
  String? get team1Score;
  @override
  String? get team2Score;
  @override
  @JsonKey(ignore: true)
  _$$MatchImplCopyWith<_$MatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TeamScore _$TeamScoreFromJson(Map<String, dynamic> json) {
  return _TeamScore.fromJson(json);
}

/// @nodoc
mixin _$TeamScore {
  String get r => throw _privateConstructorUsedError;
  String get w => throw _privateConstructorUsedError;
  String get o => throw _privateConstructorUsedError;
  String get inning => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeamScoreCopyWith<TeamScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeamScoreCopyWith<$Res> {
  factory $TeamScoreCopyWith(TeamScore value, $Res Function(TeamScore) then) =
      _$TeamScoreCopyWithImpl<$Res, TeamScore>;
  @useResult
  $Res call({String r, String w, String o, String inning});
}

/// @nodoc
class _$TeamScoreCopyWithImpl<$Res, $Val extends TeamScore>
    implements $TeamScoreCopyWith<$Res> {
  _$TeamScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? w = null,
    Object? o = null,
    Object? inning = null,
  }) {
    return _then(_value.copyWith(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as String,
      w: null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as String,
      o: null == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as String,
      inning: null == inning
          ? _value.inning
          : inning // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TeamScoreImplCopyWith<$Res>
    implements $TeamScoreCopyWith<$Res> {
  factory _$$TeamScoreImplCopyWith(
          _$TeamScoreImpl value, $Res Function(_$TeamScoreImpl) then) =
      __$$TeamScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String r, String w, String o, String inning});
}

/// @nodoc
class __$$TeamScoreImplCopyWithImpl<$Res>
    extends _$TeamScoreCopyWithImpl<$Res, _$TeamScoreImpl>
    implements _$$TeamScoreImplCopyWith<$Res> {
  __$$TeamScoreImplCopyWithImpl(
      _$TeamScoreImpl _value, $Res Function(_$TeamScoreImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? r = null,
    Object? w = null,
    Object? o = null,
    Object? inning = null,
  }) {
    return _then(_$TeamScoreImpl(
      r: null == r
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as String,
      w: null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as String,
      o: null == o
          ? _value.o
          : o // ignore: cast_nullable_to_non_nullable
              as String,
      inning: null == inning
          ? _value.inning
          : inning // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TeamScoreImpl implements _TeamScore {
  const _$TeamScoreImpl(
      {required this.r,
      required this.w,
      required this.o,
      required this.inning});

  factory _$TeamScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$TeamScoreImplFromJson(json);

  @override
  final String r;
  @override
  final String w;
  @override
  final String o;
  @override
  final String inning;

  @override
  String toString() {
    return 'TeamScore(r: $r, w: $w, o: $o, inning: $inning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TeamScoreImpl &&
            (identical(other.r, r) || other.r == r) &&
            (identical(other.w, w) || other.w == w) &&
            (identical(other.o, o) || other.o == o) &&
            (identical(other.inning, inning) || other.inning == inning));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, r, w, o, inning);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TeamScoreImplCopyWith<_$TeamScoreImpl> get copyWith =>
      __$$TeamScoreImplCopyWithImpl<_$TeamScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TeamScoreImplToJson(
      this,
    );
  }
}

abstract class _TeamScore implements TeamScore {
  const factory _TeamScore(
      {required final String r,
      required final String w,
      required final String o,
      required final String inning}) = _$TeamScoreImpl;

  factory _TeamScore.fromJson(Map<String, dynamic> json) =
      _$TeamScoreImpl.fromJson;

  @override
  String get r;
  @override
  String get w;
  @override
  String get o;
  @override
  String get inning;
  @override
  @JsonKey(ignore: true)
  _$$TeamScoreImplCopyWith<_$TeamScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
