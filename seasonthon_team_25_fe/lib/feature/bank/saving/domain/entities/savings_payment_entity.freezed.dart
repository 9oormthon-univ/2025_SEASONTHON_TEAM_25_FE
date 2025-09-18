// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_payment_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsPaymentEntity {

 String get code; String get message; String get timestamp;
/// Create a copy of SavingsPaymentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsPaymentEntityCopyWith<SavingsPaymentEntity> get copyWith => _$SavingsPaymentEntityCopyWithImpl<SavingsPaymentEntity>(this as SavingsPaymentEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsPaymentEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp);

@override
String toString() {
  return 'SavingsPaymentEntity(code: $code, message: $message, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $SavingsPaymentEntityCopyWith<$Res>  {
  factory $SavingsPaymentEntityCopyWith(SavingsPaymentEntity value, $Res Function(SavingsPaymentEntity) _then) = _$SavingsPaymentEntityCopyWithImpl;
@useResult
$Res call({
 String code, String message, String timestamp
});




}
/// @nodoc
class _$SavingsPaymentEntityCopyWithImpl<$Res>
    implements $SavingsPaymentEntityCopyWith<$Res> {
  _$SavingsPaymentEntityCopyWithImpl(this._self, this._then);

  final SavingsPaymentEntity _self;
  final $Res Function(SavingsPaymentEntity) _then;

/// Create a copy of SavingsPaymentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsPaymentEntity].
extension SavingsPaymentEntityPatterns on SavingsPaymentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsPaymentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsPaymentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsPaymentEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsPaymentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsPaymentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsPaymentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  String timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsPaymentEntity() when $default != null:
return $default(_that.code,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  String timestamp)  $default,) {final _that = this;
switch (_that) {
case _SavingsPaymentEntity():
return $default(_that.code,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  String timestamp)?  $default,) {final _that = this;
switch (_that) {
case _SavingsPaymentEntity() when $default != null:
return $default(_that.code,_that.message,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsPaymentEntity implements SavingsPaymentEntity {
  const _SavingsPaymentEntity({required this.code, required this.message, required this.timestamp});
  

@override final  String code;
@override final  String message;
@override final  String timestamp;

/// Create a copy of SavingsPaymentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsPaymentEntityCopyWith<_SavingsPaymentEntity> get copyWith => __$SavingsPaymentEntityCopyWithImpl<_SavingsPaymentEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsPaymentEntity&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp);

@override
String toString() {
  return 'SavingsPaymentEntity(code: $code, message: $message, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$SavingsPaymentEntityCopyWith<$Res> implements $SavingsPaymentEntityCopyWith<$Res> {
  factory _$SavingsPaymentEntityCopyWith(_SavingsPaymentEntity value, $Res Function(_SavingsPaymentEntity) _then) = __$SavingsPaymentEntityCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, String timestamp
});




}
/// @nodoc
class __$SavingsPaymentEntityCopyWithImpl<$Res>
    implements _$SavingsPaymentEntityCopyWith<$Res> {
  __$SavingsPaymentEntityCopyWithImpl(this._self, this._then);

  final _SavingsPaymentEntity _self;
  final $Res Function(_SavingsPaymentEntity) _then;

/// Create a copy of SavingsPaymentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? timestamp = null,}) {
  return _then(_SavingsPaymentEntity(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
