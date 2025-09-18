// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceCheckResponse {

 bool get success; String get message; String? get achievementType; bool get achievementCreated;
/// Create a copy of AttendanceCheckResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceCheckResponseCopyWith<AttendanceCheckResponse> get copyWith => _$AttendanceCheckResponseCopyWithImpl<AttendanceCheckResponse>(this as AttendanceCheckResponse, _$identity);

  /// Serializes this AttendanceCheckResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceCheckResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,achievementType,achievementCreated);

@override
String toString() {
  return 'AttendanceCheckResponse(success: $success, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated)';
}


}

/// @nodoc
abstract mixin class $AttendanceCheckResponseCopyWith<$Res>  {
  factory $AttendanceCheckResponseCopyWith(AttendanceCheckResponse value, $Res Function(AttendanceCheckResponse) _then) = _$AttendanceCheckResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String message, String? achievementType, bool achievementCreated
});




}
/// @nodoc
class _$AttendanceCheckResponseCopyWithImpl<$Res>
    implements $AttendanceCheckResponseCopyWith<$Res> {
  _$AttendanceCheckResponseCopyWithImpl(this._self, this._then);

  final AttendanceCheckResponse _self;
  final $Res Function(AttendanceCheckResponse) _then;

/// Create a copy of AttendanceCheckResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceCheckResponse].
extension AttendanceCheckResponsePatterns on AttendanceCheckResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceCheckResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceCheckResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceCheckResponse value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceCheckResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceCheckResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceCheckResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String message,  String? achievementType,  bool achievementCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceCheckResponse() when $default != null:
return $default(_that.success,_that.message,_that.achievementType,_that.achievementCreated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String message,  String? achievementType,  bool achievementCreated)  $default,) {final _that = this;
switch (_that) {
case _AttendanceCheckResponse():
return $default(_that.success,_that.message,_that.achievementType,_that.achievementCreated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String message,  String? achievementType,  bool achievementCreated)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceCheckResponse() when $default != null:
return $default(_that.success,_that.message,_that.achievementType,_that.achievementCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceCheckResponse implements AttendanceCheckResponse {
  const _AttendanceCheckResponse({required this.success, required this.message, this.achievementType, required this.achievementCreated});
  factory _AttendanceCheckResponse.fromJson(Map<String, dynamic> json) => _$AttendanceCheckResponseFromJson(json);

@override final  bool success;
@override final  String message;
@override final  String? achievementType;
@override final  bool achievementCreated;

/// Create a copy of AttendanceCheckResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceCheckResponseCopyWith<_AttendanceCheckResponse> get copyWith => __$AttendanceCheckResponseCopyWithImpl<_AttendanceCheckResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceCheckResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceCheckResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,achievementType,achievementCreated);

@override
String toString() {
  return 'AttendanceCheckResponse(success: $success, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated)';
}


}

/// @nodoc
abstract mixin class _$AttendanceCheckResponseCopyWith<$Res> implements $AttendanceCheckResponseCopyWith<$Res> {
  factory _$AttendanceCheckResponseCopyWith(_AttendanceCheckResponse value, $Res Function(_AttendanceCheckResponse) _then) = __$AttendanceCheckResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, String? achievementType, bool achievementCreated
});




}
/// @nodoc
class __$AttendanceCheckResponseCopyWithImpl<$Res>
    implements _$AttendanceCheckResponseCopyWith<$Res> {
  __$AttendanceCheckResponseCopyWithImpl(this._self, this._then);

  final _AttendanceCheckResponse _self;
  final $Res Function(_AttendanceCheckResponse) _then;

/// Create a copy of AttendanceCheckResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,}) {
  return _then(_AttendanceCheckResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
