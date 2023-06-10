// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
mixin _$Item {
  int get groceryId => throw _privateConstructorUsedError;
  String get groceryName => throw _privateConstructorUsedError;
  int get day => throw _privateConstructorUsedError;
  int get frequency => throw _privateConstructorUsedError;
  int get isDeleted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res, Item>;
  @useResult
  $Res call(
      {int groceryId,
      String groceryName,
      int day,
      int frequency,
      int isDeleted});
}

/// @nodoc
class _$ItemCopyWithImpl<$Res, $Val extends Item>
    implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryId = null,
    Object? groceryName = null,
    Object? day = null,
    Object? frequency = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      groceryId: null == groceryId
          ? _value.groceryId
          : groceryId // ignore: cast_nullable_to_non_nullable
              as int,
      groceryName: null == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$$_ItemCopyWith(_$_Item value, $Res Function(_$_Item) then) =
      __$$_ItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int groceryId,
      String groceryName,
      int day,
      int frequency,
      int isDeleted});
}

/// @nodoc
class __$$_ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res, _$_Item>
    implements _$$_ItemCopyWith<$Res> {
  __$$_ItemCopyWithImpl(_$_Item _value, $Res Function(_$_Item) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groceryId = null,
    Object? groceryName = null,
    Object? day = null,
    Object? frequency = null,
    Object? isDeleted = null,
  }) {
    return _then(_$_Item(
      groceryId: null == groceryId
          ? _value.groceryId
          : groceryId // ignore: cast_nullable_to_non_nullable
              as int,
      groceryName: null == groceryName
          ? _value.groceryName
          : groceryName // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Item implements _Item {
  const _$_Item(
      {required this.groceryId,
      required this.groceryName,
      required this.day,
      required this.frequency,
      required this.isDeleted});

  factory _$_Item.fromJson(Map<String, dynamic> json) => _$$_ItemFromJson(json);

  @override
  final int groceryId;
  @override
  final String groceryName;
  @override
  final int day;
  @override
  final int frequency;
  @override
  final int isDeleted;

  @override
  String toString() {
    return 'Item(groceryId: $groceryId, groceryName: $groceryName, day: $day, frequency: $frequency, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Item &&
            (identical(other.groceryId, groceryId) ||
                other.groceryId == groceryId) &&
            (identical(other.groceryName, groceryName) ||
                other.groceryName == groceryName) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, groceryId, groceryName, day, frequency, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemCopyWith<_$_Item> get copyWith =>
      __$$_ItemCopyWithImpl<_$_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemToJson(
      this,
    );
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required final int groceryId,
      required final String groceryName,
      required final int day,
      required final int frequency,
      required final int isDeleted}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  int get groceryId;
  @override
  String get groceryName;
  @override
  int get day;
  @override
  int get frequency;
  @override
  int get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$_ItemCopyWith<_$_Item> get copyWith => throw _privateConstructorUsedError;
}
