// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsProductEntity {

 int get productSnapshotId; String get productName; String get bankName; String get aiSummary;
/// Create a copy of SavingsProductEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductEntityCopyWith<SavingsProductEntity> get copyWith => _$SavingsProductEntityCopyWithImpl<SavingsProductEntity>(this as SavingsProductEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductEntity&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary));
}


@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,productName,bankName,aiSummary);

@override
String toString() {
  return 'SavingsProductEntity(productSnapshotId: $productSnapshotId, productName: $productName, bankName: $bankName, aiSummary: $aiSummary)';
}


}

/// @nodoc
abstract mixin class $SavingsProductEntityCopyWith<$Res>  {
  factory $SavingsProductEntityCopyWith(SavingsProductEntity value, $Res Function(SavingsProductEntity) _then) = _$SavingsProductEntityCopyWithImpl;
@useResult
$Res call({
 int productSnapshotId, String productName, String bankName, String aiSummary
});




}
/// @nodoc
class _$SavingsProductEntityCopyWithImpl<$Res>
    implements $SavingsProductEntityCopyWith<$Res> {
  _$SavingsProductEntityCopyWithImpl(this._self, this._then);

  final SavingsProductEntity _self;
  final $Res Function(SavingsProductEntity) _then;

/// Create a copy of SavingsProductEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productSnapshotId = null,Object? productName = null,Object? bankName = null,Object? aiSummary = null,}) {
  return _then(_self.copyWith(
productSnapshotId: null == productSnapshotId ? _self.productSnapshotId : productSnapshotId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsProductEntity].
extension SavingsProductEntityPatterns on SavingsProductEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int productSnapshotId,  String productName,  String bankName,  String aiSummary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsProductEntity() when $default != null:
return $default(_that.productSnapshotId,_that.productName,_that.bankName,_that.aiSummary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int productSnapshotId,  String productName,  String bankName,  String aiSummary)  $default,) {final _that = this;
switch (_that) {
case _SavingsProductEntity():
return $default(_that.productSnapshotId,_that.productName,_that.bankName,_that.aiSummary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int productSnapshotId,  String productName,  String bankName,  String aiSummary)?  $default,) {final _that = this;
switch (_that) {
case _SavingsProductEntity() when $default != null:
return $default(_that.productSnapshotId,_that.productName,_that.bankName,_that.aiSummary);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsProductEntity implements SavingsProductEntity {
  const _SavingsProductEntity({required this.productSnapshotId, required this.productName, required this.bankName, required this.aiSummary});
  

@override final  int productSnapshotId;
@override final  String productName;
@override final  String bankName;
@override final  String aiSummary;

/// Create a copy of SavingsProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductEntityCopyWith<_SavingsProductEntity> get copyWith => __$SavingsProductEntityCopyWithImpl<_SavingsProductEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductEntity&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary));
}


@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,productName,bankName,aiSummary);

@override
String toString() {
  return 'SavingsProductEntity(productSnapshotId: $productSnapshotId, productName: $productName, bankName: $bankName, aiSummary: $aiSummary)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductEntityCopyWith<$Res> implements $SavingsProductEntityCopyWith<$Res> {
  factory _$SavingsProductEntityCopyWith(_SavingsProductEntity value, $Res Function(_SavingsProductEntity) _then) = __$SavingsProductEntityCopyWithImpl;
@override @useResult
$Res call({
 int productSnapshotId, String productName, String bankName, String aiSummary
});




}
/// @nodoc
class __$SavingsProductEntityCopyWithImpl<$Res>
    implements _$SavingsProductEntityCopyWith<$Res> {
  __$SavingsProductEntityCopyWithImpl(this._self, this._then);

  final _SavingsProductEntity _self;
  final $Res Function(_SavingsProductEntity) _then;

/// Create a copy of SavingsProductEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productSnapshotId = null,Object? productName = null,Object? bankName = null,Object? aiSummary = null,}) {
  return _then(_SavingsProductEntity(
productSnapshotId: null == productSnapshotId ? _self.productSnapshotId : productSnapshotId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
