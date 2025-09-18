// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_subscription_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsSubscriptionEntity {

 int get subscriptionId; String get startDate; String get maturityDate; String get message;
/// Create a copy of SavingsSubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsSubscriptionEntityCopyWith<SavingsSubscriptionEntity> get copyWith => _$SavingsSubscriptionEntityCopyWithImpl<SavingsSubscriptionEntity>(this as SavingsSubscriptionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsSubscriptionEntity&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionId,startDate,maturityDate,message);

@override
String toString() {
  return 'SavingsSubscriptionEntity(subscriptionId: $subscriptionId, startDate: $startDate, maturityDate: $maturityDate, message: $message)';
}


}

/// @nodoc
abstract mixin class $SavingsSubscriptionEntityCopyWith<$Res>  {
  factory $SavingsSubscriptionEntityCopyWith(SavingsSubscriptionEntity value, $Res Function(SavingsSubscriptionEntity) _then) = _$SavingsSubscriptionEntityCopyWithImpl;
@useResult
$Res call({
 int subscriptionId, String startDate, String maturityDate, String message
});




}
/// @nodoc
class _$SavingsSubscriptionEntityCopyWithImpl<$Res>
    implements $SavingsSubscriptionEntityCopyWith<$Res> {
  _$SavingsSubscriptionEntityCopyWithImpl(this._self, this._then);

  final SavingsSubscriptionEntity _self;
  final $Res Function(SavingsSubscriptionEntity) _then;

/// Create a copy of SavingsSubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriptionId = null,Object? startDate = null,Object? maturityDate = null,Object? message = null,}) {
  return _then(_self.copyWith(
subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,maturityDate: null == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsSubscriptionEntity].
extension SavingsSubscriptionEntityPatterns on SavingsSubscriptionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsSubscriptionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsSubscriptionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsSubscriptionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subscriptionId,  String startDate,  String maturityDate,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity() when $default != null:
return $default(_that.subscriptionId,_that.startDate,_that.maturityDate,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subscriptionId,  String startDate,  String maturityDate,  String message)  $default,) {final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity():
return $default(_that.subscriptionId,_that.startDate,_that.maturityDate,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subscriptionId,  String startDate,  String maturityDate,  String message)?  $default,) {final _that = this;
switch (_that) {
case _SavingsSubscriptionEntity() when $default != null:
return $default(_that.subscriptionId,_that.startDate,_that.maturityDate,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsSubscriptionEntity implements SavingsSubscriptionEntity {
  const _SavingsSubscriptionEntity({required this.subscriptionId, required this.startDate, required this.maturityDate, required this.message});
  

@override final  int subscriptionId;
@override final  String startDate;
@override final  String maturityDate;
@override final  String message;

/// Create a copy of SavingsSubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsSubscriptionEntityCopyWith<_SavingsSubscriptionEntity> get copyWith => __$SavingsSubscriptionEntityCopyWithImpl<_SavingsSubscriptionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsSubscriptionEntity&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionId,startDate,maturityDate,message);

@override
String toString() {
  return 'SavingsSubscriptionEntity(subscriptionId: $subscriptionId, startDate: $startDate, maturityDate: $maturityDate, message: $message)';
}


}

/// @nodoc
abstract mixin class _$SavingsSubscriptionEntityCopyWith<$Res> implements $SavingsSubscriptionEntityCopyWith<$Res> {
  factory _$SavingsSubscriptionEntityCopyWith(_SavingsSubscriptionEntity value, $Res Function(_SavingsSubscriptionEntity) _then) = __$SavingsSubscriptionEntityCopyWithImpl;
@override @useResult
$Res call({
 int subscriptionId, String startDate, String maturityDate, String message
});




}
/// @nodoc
class __$SavingsSubscriptionEntityCopyWithImpl<$Res>
    implements _$SavingsSubscriptionEntityCopyWith<$Res> {
  __$SavingsSubscriptionEntityCopyWithImpl(this._self, this._then);

  final _SavingsSubscriptionEntity _self;
  final $Res Function(_SavingsSubscriptionEntity) _then;

/// Create a copy of SavingsSubscriptionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriptionId = null,Object? startDate = null,Object? maturityDate = null,Object? message = null,}) {
  return _then(_SavingsSubscriptionEntity(
subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,maturityDate: null == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$SavingsSubscriptionRequestEntity {

 String get productSnapshotId; String get termMonths; String get autoDebitAmount; String get reserveType;
/// Create a copy of SavingsSubscriptionRequestEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsSubscriptionRequestEntityCopyWith<SavingsSubscriptionRequestEntity> get copyWith => _$SavingsSubscriptionRequestEntityCopyWithImpl<SavingsSubscriptionRequestEntity>(this as SavingsSubscriptionRequestEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsSubscriptionRequestEntity&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.termMonths, termMonths) || other.termMonths == termMonths)&&(identical(other.autoDebitAmount, autoDebitAmount) || other.autoDebitAmount == autoDebitAmount)&&(identical(other.reserveType, reserveType) || other.reserveType == reserveType));
}


@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,termMonths,autoDebitAmount,reserveType);

@override
String toString() {
  return 'SavingsSubscriptionRequestEntity(productSnapshotId: $productSnapshotId, termMonths: $termMonths, autoDebitAmount: $autoDebitAmount, reserveType: $reserveType)';
}


}

/// @nodoc
abstract mixin class $SavingsSubscriptionRequestEntityCopyWith<$Res>  {
  factory $SavingsSubscriptionRequestEntityCopyWith(SavingsSubscriptionRequestEntity value, $Res Function(SavingsSubscriptionRequestEntity) _then) = _$SavingsSubscriptionRequestEntityCopyWithImpl;
@useResult
$Res call({
 String productSnapshotId, String termMonths, String autoDebitAmount, String reserveType
});




}
/// @nodoc
class _$SavingsSubscriptionRequestEntityCopyWithImpl<$Res>
    implements $SavingsSubscriptionRequestEntityCopyWith<$Res> {
  _$SavingsSubscriptionRequestEntityCopyWithImpl(this._self, this._then);

  final SavingsSubscriptionRequestEntity _self;
  final $Res Function(SavingsSubscriptionRequestEntity) _then;

/// Create a copy of SavingsSubscriptionRequestEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productSnapshotId = null,Object? termMonths = null,Object? autoDebitAmount = null,Object? reserveType = null,}) {
  return _then(_self.copyWith(
productSnapshotId: null == productSnapshotId ? _self.productSnapshotId : productSnapshotId // ignore: cast_nullable_to_non_nullable
as String,termMonths: null == termMonths ? _self.termMonths : termMonths // ignore: cast_nullable_to_non_nullable
as String,autoDebitAmount: null == autoDebitAmount ? _self.autoDebitAmount : autoDebitAmount // ignore: cast_nullable_to_non_nullable
as String,reserveType: null == reserveType ? _self.reserveType : reserveType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsSubscriptionRequestEntity].
extension SavingsSubscriptionRequestEntityPatterns on SavingsSubscriptionRequestEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsSubscriptionRequestEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsSubscriptionRequestEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsSubscriptionRequestEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productSnapshotId,  String termMonths,  String autoDebitAmount,  String reserveType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity() when $default != null:
return $default(_that.productSnapshotId,_that.termMonths,_that.autoDebitAmount,_that.reserveType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productSnapshotId,  String termMonths,  String autoDebitAmount,  String reserveType)  $default,) {final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity():
return $default(_that.productSnapshotId,_that.termMonths,_that.autoDebitAmount,_that.reserveType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productSnapshotId,  String termMonths,  String autoDebitAmount,  String reserveType)?  $default,) {final _that = this;
switch (_that) {
case _SavingsSubscriptionRequestEntity() when $default != null:
return $default(_that.productSnapshotId,_that.termMonths,_that.autoDebitAmount,_that.reserveType);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsSubscriptionRequestEntity implements SavingsSubscriptionRequestEntity {
  const _SavingsSubscriptionRequestEntity({required this.productSnapshotId, required this.termMonths, required this.autoDebitAmount, required this.reserveType});
  

@override final  String productSnapshotId;
@override final  String termMonths;
@override final  String autoDebitAmount;
@override final  String reserveType;

/// Create a copy of SavingsSubscriptionRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsSubscriptionRequestEntityCopyWith<_SavingsSubscriptionRequestEntity> get copyWith => __$SavingsSubscriptionRequestEntityCopyWithImpl<_SavingsSubscriptionRequestEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsSubscriptionRequestEntity&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.termMonths, termMonths) || other.termMonths == termMonths)&&(identical(other.autoDebitAmount, autoDebitAmount) || other.autoDebitAmount == autoDebitAmount)&&(identical(other.reserveType, reserveType) || other.reserveType == reserveType));
}


@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,termMonths,autoDebitAmount,reserveType);

@override
String toString() {
  return 'SavingsSubscriptionRequestEntity(productSnapshotId: $productSnapshotId, termMonths: $termMonths, autoDebitAmount: $autoDebitAmount, reserveType: $reserveType)';
}


}

/// @nodoc
abstract mixin class _$SavingsSubscriptionRequestEntityCopyWith<$Res> implements $SavingsSubscriptionRequestEntityCopyWith<$Res> {
  factory _$SavingsSubscriptionRequestEntityCopyWith(_SavingsSubscriptionRequestEntity value, $Res Function(_SavingsSubscriptionRequestEntity) _then) = __$SavingsSubscriptionRequestEntityCopyWithImpl;
@override @useResult
$Res call({
 String productSnapshotId, String termMonths, String autoDebitAmount, String reserveType
});




}
/// @nodoc
class __$SavingsSubscriptionRequestEntityCopyWithImpl<$Res>
    implements _$SavingsSubscriptionRequestEntityCopyWith<$Res> {
  __$SavingsSubscriptionRequestEntityCopyWithImpl(this._self, this._then);

  final _SavingsSubscriptionRequestEntity _self;
  final $Res Function(_SavingsSubscriptionRequestEntity) _then;

/// Create a copy of SavingsSubscriptionRequestEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productSnapshotId = null,Object? termMonths = null,Object? autoDebitAmount = null,Object? reserveType = null,}) {
  return _then(_SavingsSubscriptionRequestEntity(
productSnapshotId: null == productSnapshotId ? _self.productSnapshotId : productSnapshotId // ignore: cast_nullable_to_non_nullable
as String,termMonths: null == termMonths ? _self.termMonths : termMonths // ignore: cast_nullable_to_non_nullable
as String,autoDebitAmount: null == autoDebitAmount ? _self.autoDebitAmount : autoDebitAmount // ignore: cast_nullable_to_non_nullable
as String,reserveType: null == reserveType ? _self.reserveType : reserveType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
