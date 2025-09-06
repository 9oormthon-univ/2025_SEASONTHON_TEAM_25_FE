// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterRequest {

 String get characterName;
/// Create a copy of CharacterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterRequestCopyWith<CharacterRequest> get copyWith => _$CharacterRequestCopyWithImpl<CharacterRequest>(this as CharacterRequest, _$identity);

  /// Serializes this CharacterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterRequest&&(identical(other.characterName, characterName) || other.characterName == characterName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName);

@override
String toString() {
  return 'CharacterRequest(characterName: $characterName)';
}


}

/// @nodoc
abstract mixin class $CharacterRequestCopyWith<$Res>  {
  factory $CharacterRequestCopyWith(CharacterRequest value, $Res Function(CharacterRequest) _then) = _$CharacterRequestCopyWithImpl;
@useResult
$Res call({
 String characterName
});




}
/// @nodoc
class _$CharacterRequestCopyWithImpl<$Res>
    implements $CharacterRequestCopyWith<$Res> {
  _$CharacterRequestCopyWithImpl(this._self, this._then);

  final CharacterRequest _self;
  final $Res Function(CharacterRequest) _then;

/// Create a copy of CharacterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characterName = null,}) {
  return _then(_self.copyWith(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CharacterRequest].
extension CharacterRequestPatterns on CharacterRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterRequest value)  $default,){
final _that = this;
switch (_that) {
case _CharacterRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String characterName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterRequest() when $default != null:
return $default(_that.characterName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String characterName)  $default,) {final _that = this;
switch (_that) {
case _CharacterRequest():
return $default(_that.characterName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String characterName)?  $default,) {final _that = this;
switch (_that) {
case _CharacterRequest() when $default != null:
return $default(_that.characterName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CharacterRequest implements CharacterRequest {
  const _CharacterRequest({required this.characterName});
  factory _CharacterRequest.fromJson(Map<String, dynamic> json) => _$CharacterRequestFromJson(json);

@override final  String characterName;

/// Create a copy of CharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterRequestCopyWith<_CharacterRequest> get copyWith => __$CharacterRequestCopyWithImpl<_CharacterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CharacterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterRequest&&(identical(other.characterName, characterName) || other.characterName == characterName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName);

@override
String toString() {
  return 'CharacterRequest(characterName: $characterName)';
}


}

/// @nodoc
abstract mixin class _$CharacterRequestCopyWith<$Res> implements $CharacterRequestCopyWith<$Res> {
  factory _$CharacterRequestCopyWith(_CharacterRequest value, $Res Function(_CharacterRequest) _then) = __$CharacterRequestCopyWithImpl;
@override @useResult
$Res call({
 String characterName
});




}
/// @nodoc
class __$CharacterRequestCopyWithImpl<$Res>
    implements _$CharacterRequestCopyWith<$Res> {
  __$CharacterRequestCopyWithImpl(this._self, this._then);

  final _CharacterRequest _self;
  final $Res Function(_CharacterRequest) _then;

/// Create a copy of CharacterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characterName = null,}) {
  return _then(_CharacterRequest(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
