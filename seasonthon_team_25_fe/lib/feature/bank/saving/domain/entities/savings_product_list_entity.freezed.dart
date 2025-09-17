// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_product_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsProductListEntity {

 List<SavingsProductEntity> get content; List<String> get bankNames;
/// Create a copy of SavingsProductListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductListEntityCopyWith<SavingsProductListEntity> get copyWith => _$SavingsProductListEntityCopyWithImpl<SavingsProductListEntity>(this as SavingsProductListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductListEntity&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.bankNames, bankNames));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(bankNames));

@override
String toString() {
  return 'SavingsProductListEntity(content: $content, bankNames: $bankNames)';
}


}

/// @nodoc
abstract mixin class $SavingsProductListEntityCopyWith<$Res>  {
  factory $SavingsProductListEntityCopyWith(SavingsProductListEntity value, $Res Function(SavingsProductListEntity) _then) = _$SavingsProductListEntityCopyWithImpl;
@useResult
$Res call({
 List<SavingsProductEntity> content, List<String> bankNames
});




}
/// @nodoc
class _$SavingsProductListEntityCopyWithImpl<$Res>
    implements $SavingsProductListEntityCopyWith<$Res> {
  _$SavingsProductListEntityCopyWithImpl(this._self, this._then);

  final SavingsProductListEntity _self;
  final $Res Function(SavingsProductListEntity) _then;

/// Create a copy of SavingsProductListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? bankNames = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<SavingsProductEntity>,bankNames: null == bankNames ? _self.bankNames : bankNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsProductListEntity].
extension SavingsProductListEntityPatterns on SavingsProductListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductListEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SavingsProductEntity> content,  List<String> bankNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsProductListEntity() when $default != null:
return $default(_that.content,_that.bankNames);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SavingsProductEntity> content,  List<String> bankNames)  $default,) {final _that = this;
switch (_that) {
case _SavingsProductListEntity():
return $default(_that.content,_that.bankNames);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SavingsProductEntity> content,  List<String> bankNames)?  $default,) {final _that = this;
switch (_that) {
case _SavingsProductListEntity() when $default != null:
return $default(_that.content,_that.bankNames);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsProductListEntity implements SavingsProductListEntity {
  const _SavingsProductListEntity({required final  List<SavingsProductEntity> content, required final  List<String> bankNames}): _content = content,_bankNames = bankNames;
  

 final  List<SavingsProductEntity> _content;
@override List<SavingsProductEntity> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

 final  List<String> _bankNames;
@override List<String> get bankNames {
  if (_bankNames is EqualUnmodifiableListView) return _bankNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bankNames);
}


/// Create a copy of SavingsProductListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductListEntityCopyWith<_SavingsProductListEntity> get copyWith => __$SavingsProductListEntityCopyWithImpl<_SavingsProductListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductListEntity&&const DeepCollectionEquality().equals(other._content, _content)&&const DeepCollectionEquality().equals(other._bankNames, _bankNames));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),const DeepCollectionEquality().hash(_bankNames));

@override
String toString() {
  return 'SavingsProductListEntity(content: $content, bankNames: $bankNames)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductListEntityCopyWith<$Res> implements $SavingsProductListEntityCopyWith<$Res> {
  factory _$SavingsProductListEntityCopyWith(_SavingsProductListEntity value, $Res Function(_SavingsProductListEntity) _then) = __$SavingsProductListEntityCopyWithImpl;
@override @useResult
$Res call({
 List<SavingsProductEntity> content, List<String> bankNames
});




}
/// @nodoc
class __$SavingsProductListEntityCopyWithImpl<$Res>
    implements _$SavingsProductListEntityCopyWith<$Res> {
  __$SavingsProductListEntityCopyWithImpl(this._self, this._then);

  final _SavingsProductListEntity _self;
  final $Res Function(_SavingsProductListEntity) _then;

/// Create a copy of SavingsProductListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? bankNames = null,}) {
  return _then(_SavingsProductListEntity(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<SavingsProductEntity>,bankNames: null == bankNames ? _self._bankNames : bankNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
