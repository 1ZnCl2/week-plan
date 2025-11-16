// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weekly_todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeeklyTodoModel _$WeeklyTodoModelFromJson(Map<String, dynamic> json) {
  return _WeeklyTodoModel.fromJson(json);
}

/// @nodoc
mixin _$WeeklyTodoModel {
  String get todoId => throw _privateConstructorUsedError;
  String get todoName => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  bool get isSprint => throw _privateConstructorUsedError;
  bool? get includingSubtask => throw _privateConstructorUsedError;
  String? get refId => throw _privateConstructorUsedError;
  int? get impact => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get deadline => throw _privateConstructorUsedError;

  /// Serializes this WeeklyTodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyTodoModelCopyWith<WeeklyTodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyTodoModelCopyWith<$Res> {
  factory $WeeklyTodoModelCopyWith(
          WeeklyTodoModel value, $Res Function(WeeklyTodoModel) then) =
      _$WeeklyTodoModelCopyWithImpl<$Res, WeeklyTodoModel>;
  @useResult
  $Res call(
      {String todoId,
      String todoName,
      String category,
      String uid,
      bool isCompleted,
      bool isSprint,
      bool? includingSubtask,
      String? refId,
      int? impact,
      @TimestampConverter() Timestamp? deadline});
}

/// @nodoc
class _$WeeklyTodoModelCopyWithImpl<$Res, $Val extends WeeklyTodoModel>
    implements $WeeklyTodoModelCopyWith<$Res> {
  _$WeeklyTodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? todoName = null,
    Object? category = null,
    Object? uid = null,
    Object? isCompleted = null,
    Object? isSprint = null,
    Object? includingSubtask = freezed,
    Object? refId = freezed,
    Object? impact = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      todoName: null == todoName
          ? _value.todoName
          : todoName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSprint: null == isSprint
          ? _value.isSprint
          : isSprint // ignore: cast_nullable_to_non_nullable
              as bool,
      includingSubtask: freezed == includingSubtask
          ? _value.includingSubtask
          : includingSubtask // ignore: cast_nullable_to_non_nullable
              as bool?,
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      impact: freezed == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as int?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyTodoModelImplCopyWith<$Res>
    implements $WeeklyTodoModelCopyWith<$Res> {
  factory _$$WeeklyTodoModelImplCopyWith(_$WeeklyTodoModelImpl value,
          $Res Function(_$WeeklyTodoModelImpl) then) =
      __$$WeeklyTodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String todoId,
      String todoName,
      String category,
      String uid,
      bool isCompleted,
      bool isSprint,
      bool? includingSubtask,
      String? refId,
      int? impact,
      @TimestampConverter() Timestamp? deadline});
}

/// @nodoc
class __$$WeeklyTodoModelImplCopyWithImpl<$Res>
    extends _$WeeklyTodoModelCopyWithImpl<$Res, _$WeeklyTodoModelImpl>
    implements _$$WeeklyTodoModelImplCopyWith<$Res> {
  __$$WeeklyTodoModelImplCopyWithImpl(
      _$WeeklyTodoModelImpl _value, $Res Function(_$WeeklyTodoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? todoName = null,
    Object? category = null,
    Object? uid = null,
    Object? isCompleted = null,
    Object? isSprint = null,
    Object? includingSubtask = freezed,
    Object? refId = freezed,
    Object? impact = freezed,
    Object? deadline = freezed,
  }) {
    return _then(_$WeeklyTodoModelImpl(
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      todoName: null == todoName
          ? _value.todoName
          : todoName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      isSprint: null == isSprint
          ? _value.isSprint
          : isSprint // ignore: cast_nullable_to_non_nullable
              as bool,
      includingSubtask: freezed == includingSubtask
          ? _value.includingSubtask
          : includingSubtask // ignore: cast_nullable_to_non_nullable
              as bool?,
      refId: freezed == refId
          ? _value.refId
          : refId // ignore: cast_nullable_to_non_nullable
              as String?,
      impact: freezed == impact
          ? _value.impact
          : impact // ignore: cast_nullable_to_non_nullable
              as int?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as Timestamp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyTodoModelImpl implements _WeeklyTodoModel {
  _$WeeklyTodoModelImpl(
      {required this.todoId,
      required this.todoName,
      required this.category,
      required this.uid,
      required this.isCompleted,
      required this.isSprint,
      this.includingSubtask,
      this.refId,
      this.impact,
      @TimestampConverter() required this.deadline});

  factory _$WeeklyTodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyTodoModelImplFromJson(json);

  @override
  final String todoId;
  @override
  final String todoName;
  @override
  final String category;
  @override
  final String uid;
  @override
  final bool isCompleted;
  @override
  final bool isSprint;
  @override
  final bool? includingSubtask;
  @override
  final String? refId;
  @override
  final int? impact;
  @override
  @TimestampConverter()
  final Timestamp? deadline;

  @override
  String toString() {
    return 'WeeklyTodoModel(todoId: $todoId, todoName: $todoName, category: $category, uid: $uid, isCompleted: $isCompleted, isSprint: $isSprint, includingSubtask: $includingSubtask, refId: $refId, impact: $impact, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyTodoModelImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.todoName, todoName) ||
                other.todoName == todoName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.isSprint, isSprint) ||
                other.isSprint == isSprint) &&
            (identical(other.includingSubtask, includingSubtask) ||
                other.includingSubtask == includingSubtask) &&
            (identical(other.refId, refId) || other.refId == refId) &&
            (identical(other.impact, impact) || other.impact == impact) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, todoId, todoName, category, uid,
      isCompleted, isSprint, includingSubtask, refId, impact, deadline);

  /// Create a copy of WeeklyTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyTodoModelImplCopyWith<_$WeeklyTodoModelImpl> get copyWith =>
      __$$WeeklyTodoModelImplCopyWithImpl<_$WeeklyTodoModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyTodoModelImplToJson(
      this,
    );
  }
}

abstract class _WeeklyTodoModel implements WeeklyTodoModel {
  factory _WeeklyTodoModel(
          {required final String todoId,
          required final String todoName,
          required final String category,
          required final String uid,
          required final bool isCompleted,
          required final bool isSprint,
          final bool? includingSubtask,
          final String? refId,
          final int? impact,
          @TimestampConverter() required final Timestamp? deadline}) =
      _$WeeklyTodoModelImpl;

  factory _WeeklyTodoModel.fromJson(Map<String, dynamic> json) =
      _$WeeklyTodoModelImpl.fromJson;

  @override
  String get todoId;
  @override
  String get todoName;
  @override
  String get category;
  @override
  String get uid;
  @override
  bool get isCompleted;
  @override
  bool get isSprint;
  @override
  bool? get includingSubtask;
  @override
  String? get refId;
  @override
  int? get impact;
  @override
  @TimestampConverter()
  Timestamp? get deadline;

  /// Create a copy of WeeklyTodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyTodoModelImplCopyWith<_$WeeklyTodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
