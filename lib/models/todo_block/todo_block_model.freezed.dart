// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodoBlockModel _$TodoBlockModelFromJson(Map<String, dynamic> json) {
  return _TodoBlockModel.fromJson(json);
}

/// @nodoc
mixin _$TodoBlockModel {
  String get todoBlockId => throw _privateConstructorUsedError;
  String get todoBlockName => throw _privateConstructorUsedError;
  String get todoId => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get deadline => throw _privateConstructorUsedError;
  bool get isAssigned => throw _privateConstructorUsedError;
  String? get assignedScheduleId => throw _privateConstructorUsedError;

  /// Serializes this TodoBlockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoBlockModelCopyWith<TodoBlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoBlockModelCopyWith<$Res> {
  factory $TodoBlockModelCopyWith(
          TodoBlockModel value, $Res Function(TodoBlockModel) then) =
      _$TodoBlockModelCopyWithImpl<$Res, TodoBlockModel>;
  @useResult
  $Res call(
      {String todoBlockId,
      String todoBlockName,
      String todoId,
      String uid,
      String categoryId,
      @TimestampConverter() DateTime deadline,
      bool isAssigned,
      String? assignedScheduleId});
}

/// @nodoc
class _$TodoBlockModelCopyWithImpl<$Res, $Val extends TodoBlockModel>
    implements $TodoBlockModelCopyWith<$Res> {
  _$TodoBlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoBlockId = null,
    Object? todoBlockName = null,
    Object? todoId = null,
    Object? uid = null,
    Object? categoryId = null,
    Object? deadline = null,
    Object? isAssigned = null,
    Object? assignedScheduleId = freezed,
  }) {
    return _then(_value.copyWith(
      todoBlockId: null == todoBlockId
          ? _value.todoBlockId
          : todoBlockId // ignore: cast_nullable_to_non_nullable
              as String,
      todoBlockName: null == todoBlockName
          ? _value.todoBlockName
          : todoBlockName // ignore: cast_nullable_to_non_nullable
              as String,
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAssigned: null == isAssigned
          ? _value.isAssigned
          : isAssigned // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedScheduleId: freezed == assignedScheduleId
          ? _value.assignedScheduleId
          : assignedScheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoBlockModelImplCopyWith<$Res>
    implements $TodoBlockModelCopyWith<$Res> {
  factory _$$TodoBlockModelImplCopyWith(_$TodoBlockModelImpl value,
          $Res Function(_$TodoBlockModelImpl) then) =
      __$$TodoBlockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String todoBlockId,
      String todoBlockName,
      String todoId,
      String uid,
      String categoryId,
      @TimestampConverter() DateTime deadline,
      bool isAssigned,
      String? assignedScheduleId});
}

/// @nodoc
class __$$TodoBlockModelImplCopyWithImpl<$Res>
    extends _$TodoBlockModelCopyWithImpl<$Res, _$TodoBlockModelImpl>
    implements _$$TodoBlockModelImplCopyWith<$Res> {
  __$$TodoBlockModelImplCopyWithImpl(
      _$TodoBlockModelImpl _value, $Res Function(_$TodoBlockModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodoBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoBlockId = null,
    Object? todoBlockName = null,
    Object? todoId = null,
    Object? uid = null,
    Object? categoryId = null,
    Object? deadline = null,
    Object? isAssigned = null,
    Object? assignedScheduleId = freezed,
  }) {
    return _then(_$TodoBlockModelImpl(
      todoBlockId: null == todoBlockId
          ? _value.todoBlockId
          : todoBlockId // ignore: cast_nullable_to_non_nullable
              as String,
      todoBlockName: null == todoBlockName
          ? _value.todoBlockName
          : todoBlockName // ignore: cast_nullable_to_non_nullable
              as String,
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAssigned: null == isAssigned
          ? _value.isAssigned
          : isAssigned // ignore: cast_nullable_to_non_nullable
              as bool,
      assignedScheduleId: freezed == assignedScheduleId
          ? _value.assignedScheduleId
          : assignedScheduleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoBlockModelImpl implements _TodoBlockModel {
  _$TodoBlockModelImpl(
      {required this.todoBlockId,
      required this.todoBlockName,
      required this.todoId,
      required this.uid,
      required this.categoryId,
      @TimestampConverter() required this.deadline,
      required this.isAssigned,
      this.assignedScheduleId});

  factory _$TodoBlockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoBlockModelImplFromJson(json);

  @override
  final String todoBlockId;
  @override
  final String todoBlockName;
  @override
  final String todoId;
  @override
  final String uid;
  @override
  final String categoryId;
  @override
  @TimestampConverter()
  final DateTime deadline;
  @override
  final bool isAssigned;
  @override
  final String? assignedScheduleId;

  @override
  String toString() {
    return 'TodoBlockModel(todoBlockId: $todoBlockId, todoBlockName: $todoBlockName, todoId: $todoId, uid: $uid, categoryId: $categoryId, deadline: $deadline, isAssigned: $isAssigned, assignedScheduleId: $assignedScheduleId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoBlockModelImpl &&
            (identical(other.todoBlockId, todoBlockId) ||
                other.todoBlockId == todoBlockId) &&
            (identical(other.todoBlockName, todoBlockName) ||
                other.todoBlockName == todoBlockName) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.isAssigned, isAssigned) ||
                other.isAssigned == isAssigned) &&
            (identical(other.assignedScheduleId, assignedScheduleId) ||
                other.assignedScheduleId == assignedScheduleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, todoBlockId, todoBlockName,
      todoId, uid, categoryId, deadline, isAssigned, assignedScheduleId);

  /// Create a copy of TodoBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoBlockModelImplCopyWith<_$TodoBlockModelImpl> get copyWith =>
      __$$TodoBlockModelImplCopyWithImpl<_$TodoBlockModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoBlockModelImplToJson(
      this,
    );
  }
}

abstract class _TodoBlockModel implements TodoBlockModel {
  factory _TodoBlockModel(
      {required final String todoBlockId,
      required final String todoBlockName,
      required final String todoId,
      required final String uid,
      required final String categoryId,
      @TimestampConverter() required final DateTime deadline,
      required final bool isAssigned,
      final String? assignedScheduleId}) = _$TodoBlockModelImpl;

  factory _TodoBlockModel.fromJson(Map<String, dynamic> json) =
      _$TodoBlockModelImpl.fromJson;

  @override
  String get todoBlockId;
  @override
  String get todoBlockName;
  @override
  String get todoId;
  @override
  String get uid;
  @override
  String get categoryId;
  @override
  @TimestampConverter()
  DateTime get deadline;
  @override
  bool get isAssigned;
  @override
  String? get assignedScheduleId;

  /// Create a copy of TodoBlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoBlockModelImplCopyWith<_$TodoBlockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
