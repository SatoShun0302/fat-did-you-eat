// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
mixin _$History {
  int get historyId => throw _privateConstructorUsedError;
  int get groceryId => throw _privateConstructorUsedError;
  int get consumedDate => throw _privateConstructorUsedError;
  int get nextAllowedDate => throw _privateConstructorUsedError;
  int get isDeleted => throw _privateConstructorUsedError;
  String? get groceryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call(
      {int historyId,
      int groceryId,
      int consumedDate,
      int nextAllowedDate,
      int isDeleted,
      String? groceryName});
}

/// @nodoc
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? groceryId = null,
    Object? consumedDate = null,
    Object? nextAllowedDate = null,
    Object? isDeleted = null,
    Object? groceryName = freezed,
  }) {
    return _then(_value.copyWith(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      groceryId: null == groceryId
          ? _value.groceryId
          : groceryId // ignore: cast_nullable_to_non_nullable
              as int,
      consumedDate: null == consumedDate
          ? _value.consumedDate
          : consumedDate // ignore: cast_nullable_to_non_nullable
              as int,
      nextAllowedDate: null == nextAllowedDate
          ? _value.nextAllowedDate
          : nextAllowedDate // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      groceryName: freezed == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HistoryCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$_HistoryCopyWith(
          _$_History value, $Res Function(_$_History) then) =
      __$$_HistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int historyId,
      int groceryId,
      int consumedDate,
      int nextAllowedDate,
      int isDeleted,
      String? groceryName});
}

/// @nodoc
class __$$_HistoryCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$_History>
    implements _$$_HistoryCopyWith<$Res> {
  __$$_HistoryCopyWithImpl(_$_History _value, $Res Function(_$_History) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? historyId = null,
    Object? groceryId = null,
    Object? consumedDate = null,
    Object? nextAllowedDate = null,
    Object? isDeleted = null,
    Object? groceryName = freezed,
  }) {
    return _then(_$_History(
      historyId: null == historyId
          ? _value.historyId
          : historyId // ignore: cast_nullable_to_non_nullable
              as int,
      groceryId: null == groceryId
          ? _value.groceryId
          : groceryId // ignore: cast_nullable_to_non_nullable
              as int,
      consumedDate: null == consumedDate
          ? _value.consumedDate
          : consumedDate // ignore: cast_nullable_to_non_nullable
              as int,
      nextAllowedDate: null == nextAllowedDate
          ? _value.nextAllowedDate
          : nextAllowedDate // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      groceryName: freezed == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_History implements _History {
  const _$_History(
      {required this.historyId,
      required this.groceryId,
      required this.consumedDate,
      required this.nextAllowedDate,
      required this.isDeleted,
      this.groceryName});

  factory _$_History.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryFromJson(json);

  @override
  final int historyId;
  @override
  final int groceryId;
  @override
  final int consumedDate;
  @override
  final int nextAllowedDate;
  @override
  final int isDeleted;
  @override
  final String? groceryName;

  @override
  String toString() {
    return 'History(historyId: $historyId, groceryId: $groceryId, consumedDate: $consumedDate, nextAllowedDate: $nextAllowedDate, isDeleted: $isDeleted, groceryName: $groceryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_History &&
            (identical(other.historyId, historyId) ||
                other.historyId == historyId) &&
            (identical(other.groceryId, groceryId) ||
                other.groceryId == groceryId) &&
            (identical(other.consumedDate, consumedDate) ||
                other.consumedDate == consumedDate) &&
            (identical(other.nextAllowedDate, nextAllowedDate) ||
                other.nextAllowedDate == nextAllowedDate) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.groceryName, groceryName) ||
                other.groceryName == groceryName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, historyId, groceryId,
      consumedDate, nextAllowedDate, isDeleted, groceryName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      __$$_HistoryCopyWithImpl<_$_History>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryToJson(
      this,
    );
  }
}

abstract class _History implements History {
  const factory _History(
      {required final int historyId,
      required final int groceryId,
      required final int consumedDate,
      required final int nextAllowedDate,
      required final int isDeleted,
      final String? groceryName}) = _$_History;

  factory _History.fromJson(Map<String, dynamic> json) = _$_History.fromJson;

  @override
  int get historyId;
  @override
  int get groceryId;
  @override
  int get consumedDate;
  @override
  int get nextAllowedDate;
  @override
  int get isDeleted;
  @override
  String? get groceryName;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryCopyWith<_$_History> get copyWith =>
      throw _privateConstructorUsedError;
}
