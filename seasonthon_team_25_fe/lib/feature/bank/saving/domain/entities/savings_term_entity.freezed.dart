// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_term_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsTermEntity {

 String get term; String get description;
/// Create a copy of SavingsTermEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsTermEntityCopyWith<SavingsTermEntity> get copyWith => _$SavingsTermEntityCopyWithImpl<SavingsTermEntity>(this as SavingsTermEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsTermEntity&&(identical(other.term, term) || other.term == term)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,term,description);

@override
String toString() {
  return 'SavingsTermEntity(term: $term, description: $description)';
}


}

/// @nodoc
abstract mixin class $SavingsTermEntityCopyWith<$Res>  {
  factory $SavingsTermEntityCopyWith(SavingsTermEntity value, $Res Function(SavingsTermEntity) _then) = _$SavingsTermEntityCopyWithImpl;
@useResult
$Res call({
 String term, String description
});




}
/// @nodoc
class _$SavingsTermEntityCopyWithImpl<$Res>
    implements $SavingsTermEntityCopyWith<$Res> {
  _$SavingsTermEntityCopyWithImpl(this._self, this._then);

  final SavingsTermEntity _self;
  final $Res Function(SavingsTermEntity) _then;

/// Create a copy of SavingsTermEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? term = null,Object? description = null,}) {
  return _then(_self.copyWith(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsTermEntity].
extension SavingsTermEntityPatterns on SavingsTermEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsTermEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsTermEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsTermEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsTermEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsTermEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsTermEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String term,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsTermEntity() when $default != null:
return $default(_that.term,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String term,  String description)  $default,) {final _that = this;
switch (_that) {
case _SavingsTermEntity():
return $default(_that.term,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String term,  String description)?  $default,) {final _that = this;
switch (_that) {
case _SavingsTermEntity() when $default != null:
return $default(_that.term,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsTermEntity implements SavingsTermEntity {
  const _SavingsTermEntity({required this.term, required this.description});
  

@override final  String term;
@override final  String description;

/// Create a copy of SavingsTermEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsTermEntityCopyWith<_SavingsTermEntity> get copyWith => __$SavingsTermEntityCopyWithImpl<_SavingsTermEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsTermEntity&&(identical(other.term, term) || other.term == term)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,term,description);

@override
String toString() {
  return 'SavingsTermEntity(term: $term, description: $description)';
}


}

/// @nodoc
abstract mixin class _$SavingsTermEntityCopyWith<$Res> implements $SavingsTermEntityCopyWith<$Res> {
  factory _$SavingsTermEntityCopyWith(_SavingsTermEntity value, $Res Function(_SavingsTermEntity) _then) = __$SavingsTermEntityCopyWithImpl;
@override @useResult
$Res call({
 String term, String description
});




}
/// @nodoc
class __$SavingsTermEntityCopyWithImpl<$Res>
    implements _$SavingsTermEntityCopyWith<$Res> {
  __$SavingsTermEntityCopyWithImpl(this._self, this._then);

  final _SavingsTermEntity _self;
  final $Res Function(_SavingsTermEntity) _then;

/// Create a copy of SavingsTermEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? term = null,Object? description = null,}) {
  return _then(_SavingsTermEntity(
term: null == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
