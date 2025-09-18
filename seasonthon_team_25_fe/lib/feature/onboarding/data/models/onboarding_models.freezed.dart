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
mixin _$NickNameRequest {

 String get characterName;
/// Create a copy of NickNameRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NickNameRequestCopyWith<NickNameRequest> get copyWith => _$NickNameRequestCopyWithImpl<NickNameRequest>(this as NickNameRequest, _$identity);

  /// Serializes this NickNameRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NickNameRequest&&(identical(other.characterName, characterName) || other.characterName == characterName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName);

@override
String toString() {
  return 'NickNameRequest(characterName: $characterName)';
}


}

/// @nodoc
abstract mixin class $NickNameRequestCopyWith<$Res>  {
  factory $NickNameRequestCopyWith(NickNameRequest value, $Res Function(NickNameRequest) _then) = _$NickNameRequestCopyWithImpl;
@useResult
$Res call({
 String characterName
});




}
/// @nodoc
class _$NickNameRequestCopyWithImpl<$Res>
    implements $NickNameRequestCopyWith<$Res> {
  _$NickNameRequestCopyWithImpl(this._self, this._then);

  final NickNameRequest _self;
  final $Res Function(NickNameRequest) _then;

/// Create a copy of NickNameRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characterName = null,}) {
  return _then(_self.copyWith(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NickNameRequest].
extension NickNameRequestPatterns on NickNameRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NickNameRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NickNameRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NickNameRequest value)  $default,){
final _that = this;
switch (_that) {
case _NickNameRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NickNameRequest value)?  $default,){
final _that = this;
switch (_that) {
case _NickNameRequest() when $default != null:
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
case _NickNameRequest() when $default != null:
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
case _NickNameRequest():
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
case _NickNameRequest() when $default != null:
return $default(_that.characterName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _NickNameRequest implements NickNameRequest {
  const _NickNameRequest({required this.characterName});
  factory _NickNameRequest.fromJson(Map<String, dynamic> json) => _$NickNameRequestFromJson(json);

@override final  String characterName;

/// Create a copy of NickNameRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NickNameRequestCopyWith<_NickNameRequest> get copyWith => __$NickNameRequestCopyWithImpl<_NickNameRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NickNameRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NickNameRequest&&(identical(other.characterName, characterName) || other.characterName == characterName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName);

@override
String toString() {
  return 'NickNameRequest(characterName: $characterName)';
}


}

/// @nodoc
abstract mixin class _$NickNameRequestCopyWith<$Res> implements $NickNameRequestCopyWith<$Res> {
  factory _$NickNameRequestCopyWith(_NickNameRequest value, $Res Function(_NickNameRequest) _then) = __$NickNameRequestCopyWithImpl;
@override @useResult
$Res call({
 String characterName
});




}
/// @nodoc
class __$NickNameRequestCopyWithImpl<$Res>
    implements _$NickNameRequestCopyWith<$Res> {
  __$NickNameRequestCopyWithImpl(this._self, this._then);

  final _NickNameRequest _self;
  final $Res Function(_NickNameRequest) _then;

/// Create a copy of NickNameRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characterName = null,}) {
  return _then(_NickNameRequest(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NickNameResponse {

 String get characterName; bool get characterCreated; String? get message;
/// Create a copy of NickNameResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NickNameResponseCopyWith<NickNameResponse> get copyWith => _$NickNameResponseCopyWithImpl<NickNameResponse>(this as NickNameResponse, _$identity);

  /// Serializes this NickNameResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NickNameResponse&&(identical(other.characterName, characterName) || other.characterName == characterName)&&(identical(other.characterCreated, characterCreated) || other.characterCreated == characterCreated)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName,characterCreated,message);

@override
String toString() {
  return 'NickNameResponse(characterName: $characterName, characterCreated: $characterCreated, message: $message)';
}


}

/// @nodoc
abstract mixin class $NickNameResponseCopyWith<$Res>  {
  factory $NickNameResponseCopyWith(NickNameResponse value, $Res Function(NickNameResponse) _then) = _$NickNameResponseCopyWithImpl;
@useResult
$Res call({
 String characterName, bool characterCreated, String? message
});




}
/// @nodoc
class _$NickNameResponseCopyWithImpl<$Res>
    implements $NickNameResponseCopyWith<$Res> {
  _$NickNameResponseCopyWithImpl(this._self, this._then);

  final NickNameResponse _self;
  final $Res Function(NickNameResponse) _then;

/// Create a copy of NickNameResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? characterName = null,Object? characterCreated = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,characterCreated: null == characterCreated ? _self.characterCreated : characterCreated // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NickNameResponse].
extension NickNameResponsePatterns on NickNameResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NickNameResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NickNameResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NickNameResponse value)  $default,){
final _that = this;
switch (_that) {
case _NickNameResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NickNameResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NickNameResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String characterName,  bool characterCreated,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NickNameResponse() when $default != null:
return $default(_that.characterName,_that.characterCreated,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String characterName,  bool characterCreated,  String? message)  $default,) {final _that = this;
switch (_that) {
case _NickNameResponse():
return $default(_that.characterName,_that.characterCreated,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String characterName,  bool characterCreated,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _NickNameResponse() when $default != null:
return $default(_that.characterName,_that.characterCreated,_that.message);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _NickNameResponse implements NickNameResponse {
  const _NickNameResponse({required this.characterName, required this.characterCreated, this.message});
  factory _NickNameResponse.fromJson(Map<String, dynamic> json) => _$NickNameResponseFromJson(json);

@override final  String characterName;
@override final  bool characterCreated;
@override final  String? message;

/// Create a copy of NickNameResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NickNameResponseCopyWith<_NickNameResponse> get copyWith => __$NickNameResponseCopyWithImpl<_NickNameResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NickNameResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NickNameResponse&&(identical(other.characterName, characterName) || other.characterName == characterName)&&(identical(other.characterCreated, characterCreated) || other.characterCreated == characterCreated)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,characterName,characterCreated,message);

@override
String toString() {
  return 'NickNameResponse(characterName: $characterName, characterCreated: $characterCreated, message: $message)';
}


}

/// @nodoc
abstract mixin class _$NickNameResponseCopyWith<$Res> implements $NickNameResponseCopyWith<$Res> {
  factory _$NickNameResponseCopyWith(_NickNameResponse value, $Res Function(_NickNameResponse) _then) = __$NickNameResponseCopyWithImpl;
@override @useResult
$Res call({
 String characterName, bool characterCreated, String? message
});




}
/// @nodoc
class __$NickNameResponseCopyWithImpl<$Res>
    implements _$NickNameResponseCopyWith<$Res> {
  __$NickNameResponseCopyWithImpl(this._self, this._then);

  final _NickNameResponse _self;
  final $Res Function(_NickNameResponse) _then;

/// Create a copy of NickNameResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? characterName = null,Object? characterCreated = null,Object? message = freezed,}) {
  return _then(_NickNameResponse(
characterName: null == characterName ? _self.characterName : characterName // ignore: cast_nullable_to_non_nullable
as String,characterCreated: null == characterCreated ? _self.characterCreated : characterCreated // ignore: cast_nullable_to_non_nullable
as bool,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
