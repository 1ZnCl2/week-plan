// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comprehensive_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComprehensiveModel _$ComprehensiveModelFromJson(Map<String, dynamic> json) {
  return _ComprehensiveModel.fromJson(json);
}

/// @nodoc
mixin _$ComprehensiveModel {
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get content_name => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get date => throw _privateConstructorUsedError;
  bool get is_completed => throw _privateConstructorUsedError;

  /// Serializes this ComprehensiveModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComprehensiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComprehensiveModelCopyWith<ComprehensiveModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComprehensiveModelCopyWith<$Res> {
  factory $ComprehensiveModelCopyWith(
          ComprehensiveModel value, $Res Function(ComprehensiveModel) then) =
      _$ComprehensiveModelCopyWithImpl<$Res, ComprehensiveModel>;
  @useResult
  $Res call(
      {String id,
      String uid,
      String content_name,
      @TimestampConverter() DateTime date,
      bool is_completed});
}

/// @nodoc
class _$ComprehensiveModelCopyWithImpl<$Res, $Val extends ComprehensiveModel>
    implements $ComprehensiveModelCopyWith<$Res> {
  _$ComprehensiveModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComprehensiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? content_name = null,
    Object? date = null,
    Object? is_completed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content_name: null == content_name
          ? _value.content_name
          : content_name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_completed: null == is_completed
          ? _value.is_completed
          : is_completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ComprehensiveModelImplCopyWith<$Res>
    implements $ComprehensiveModelCopyWith<$Res> {
  factory _$$ComprehensiveModelImplCopyWith(_$ComprehensiveModelImpl value,
          $Res Function(_$ComprehensiveModelImpl) then) =
      __$$ComprehensiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String uid,
      String content_name,
      @TimestampConverter() DateTime date,
      bool is_completed});
}

/// @nodoc
class __$$ComprehensiveModelImplCopyWithImpl<$Res>
    extends _$ComprehensiveModelCopyWithImpl<$Res, _$ComprehensiveModelImpl>
    implements _$$ComprehensiveModelImplCopyWith<$Res> {
  __$$ComprehensiveModelImplCopyWithImpl(_$ComprehensiveModelImpl _value,
      $Res Function(_$ComprehensiveModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComprehensiveModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? content_name = null,
    Object? date = null,
    Object? is_completed = null,
  }) {
    return _then(_$ComprehensiveModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content_name: null == content_name
          ? _value.content_name
          : content_name // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      is_completed: null == is_completed
          ? _value.is_completed
          : is_completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ComprehensiveModelImpl implements _ComprehensiveModel {
  _$ComprehensiveModelImpl(
      {required this.id,
      required this.uid,
      required this.content_name,
      @TimestampConverter() required this.date,
      required this.is_completed});

  factory _$ComprehensiveModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComprehensiveModelImplFromJson(json);

  @override
  final String id;
  @override
  final String uid;
  @override
  final String content_name;
  @override
  @TimestampConverter()
  final DateTime date;
  @override
  final bool is_completed;

  @override
  String toString() {
    return 'ComprehensiveModel(id: $id, uid: $uid, content_name: $content_name, date: $date, is_completed: $is_completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComprehensiveModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.content_name, content_name) ||
                other.content_name == content_name) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.is_completed, is_completed) ||
                other.is_completed == is_completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uid, content_name, date, is_completed);

  /// Create a copy of ComprehensiveModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComprehensiveModelImplCopyWith<_$ComprehensiveModelImpl> get copyWith =>
      __$$ComprehensiveModelImplCopyWithImpl<_$ComprehensiveModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComprehensiveModelImplToJson(
      this,
    );
  }
}

abstract class _ComprehensiveModel implements ComprehensiveModel {
  factory _ComprehensiveModel(
      {required final String id,
      required final String uid,
      required final String content_name,
      @TimestampConverter() required final DateTime date,
      required final bool is_completed}) = _$ComprehensiveModelImpl;

  factory _ComprehensiveModel.fromJson(Map<String, dynamic> json) =
      _$ComprehensiveModelImpl.fromJson;

  @override
  String get id;
  @override
  String get uid;
  @override
  String get content_name;
  @override
  @TimestampConverter()
  DateTime get date;
  @override
  bool get is_completed;

  /// Create a copy of ComprehensiveModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComprehensiveModelImplCopyWith<_$ComprehensiveModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
