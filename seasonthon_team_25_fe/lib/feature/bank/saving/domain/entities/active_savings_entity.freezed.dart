// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_savings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActiveSavingsEntity {

 int get subscriptionId; String get productName; int get currentAmount; int get progressPercentage; String get joinDate; String get maturityDate; int get remainingPayments;
/// Create a copy of ActiveSavingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveSavingsEntityCopyWith<ActiveSavingsEntity> get copyWith => _$ActiveSavingsEntityCopyWithImpl<ActiveSavingsEntity>(this as ActiveSavingsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveSavingsEntity&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.joinDate, joinDate) || other.joinDate == joinDate)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.remainingPayments, remainingPayments) || other.remainingPayments == remainingPayments));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionId,productName,currentAmount,progressPercentage,joinDate,maturityDate,remainingPayments);

@override
String toString() {
  return 'ActiveSavingsEntity(subscriptionId: $subscriptionId, productName: $productName, currentAmount: $currentAmount, progressPercentage: $progressPercentage, joinDate: $joinDate, maturityDate: $maturityDate, remainingPayments: $remainingPayments)';
}


}

/// @nodoc
abstract mixin class $ActiveSavingsEntityCopyWith<$Res>  {
  factory $ActiveSavingsEntityCopyWith(ActiveSavingsEntity value, $Res Function(ActiveSavingsEntity) _then) = _$ActiveSavingsEntityCopyWithImpl;
@useResult
$Res call({
 int subscriptionId, String productName, int currentAmount, int progressPercentage, String joinDate, String maturityDate, int remainingPayments
});




}
/// @nodoc
class _$ActiveSavingsEntityCopyWithImpl<$Res>
    implements $ActiveSavingsEntityCopyWith<$Res> {
  _$ActiveSavingsEntityCopyWithImpl(this._self, this._then);

  final ActiveSavingsEntity _self;
  final $Res Function(ActiveSavingsEntity) _then;

/// Create a copy of ActiveSavingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subscriptionId = null,Object? productName = null,Object? currentAmount = null,Object? progressPercentage = null,Object? joinDate = null,Object? maturityDate = null,Object? remainingPayments = null,}) {
  return _then(_self.copyWith(
subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as int,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as int,joinDate: null == joinDate ? _self.joinDate : joinDate // ignore: cast_nullable_to_non_nullable
as String,maturityDate: null == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String,remainingPayments: null == remainingPayments ? _self.remainingPayments : remainingPayments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveSavingsEntity].
extension ActiveSavingsEntityPatterns on ActiveSavingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveSavingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveSavingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveSavingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActiveSavingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveSavingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveSavingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subscriptionId,  String productName,  int currentAmount,  int progressPercentage,  String joinDate,  String maturityDate,  int remainingPayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveSavingsEntity() when $default != null:
return $default(_that.subscriptionId,_that.productName,_that.currentAmount,_that.progressPercentage,_that.joinDate,_that.maturityDate,_that.remainingPayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subscriptionId,  String productName,  int currentAmount,  int progressPercentage,  String joinDate,  String maturityDate,  int remainingPayments)  $default,) {final _that = this;
switch (_that) {
case _ActiveSavingsEntity():
return $default(_that.subscriptionId,_that.productName,_that.currentAmount,_that.progressPercentage,_that.joinDate,_that.maturityDate,_that.remainingPayments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subscriptionId,  String productName,  int currentAmount,  int progressPercentage,  String joinDate,  String maturityDate,  int remainingPayments)?  $default,) {final _that = this;
switch (_that) {
case _ActiveSavingsEntity() when $default != null:
return $default(_that.subscriptionId,_that.productName,_that.currentAmount,_that.progressPercentage,_that.joinDate,_that.maturityDate,_that.remainingPayments);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveSavingsEntity implements ActiveSavingsEntity {
  const _ActiveSavingsEntity({required this.subscriptionId, required this.productName, required this.currentAmount, required this.progressPercentage, required this.joinDate, required this.maturityDate, required this.remainingPayments});
  

@override final  int subscriptionId;
@override final  String productName;
@override final  int currentAmount;
@override final  int progressPercentage;
@override final  String joinDate;
@override final  String maturityDate;
@override final  int remainingPayments;

/// Create a copy of ActiveSavingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveSavingsEntityCopyWith<_ActiveSavingsEntity> get copyWith => __$ActiveSavingsEntityCopyWithImpl<_ActiveSavingsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveSavingsEntity&&(identical(other.subscriptionId, subscriptionId) || other.subscriptionId == subscriptionId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.currentAmount, currentAmount) || other.currentAmount == currentAmount)&&(identical(other.progressPercentage, progressPercentage) || other.progressPercentage == progressPercentage)&&(identical(other.joinDate, joinDate) || other.joinDate == joinDate)&&(identical(other.maturityDate, maturityDate) || other.maturityDate == maturityDate)&&(identical(other.remainingPayments, remainingPayments) || other.remainingPayments == remainingPayments));
}


@override
int get hashCode => Object.hash(runtimeType,subscriptionId,productName,currentAmount,progressPercentage,joinDate,maturityDate,remainingPayments);

@override
String toString() {
  return 'ActiveSavingsEntity(subscriptionId: $subscriptionId, productName: $productName, currentAmount: $currentAmount, progressPercentage: $progressPercentage, joinDate: $joinDate, maturityDate: $maturityDate, remainingPayments: $remainingPayments)';
}


}

/// @nodoc
abstract mixin class _$ActiveSavingsEntityCopyWith<$Res> implements $ActiveSavingsEntityCopyWith<$Res> {
  factory _$ActiveSavingsEntityCopyWith(_ActiveSavingsEntity value, $Res Function(_ActiveSavingsEntity) _then) = __$ActiveSavingsEntityCopyWithImpl;
@override @useResult
$Res call({
 int subscriptionId, String productName, int currentAmount, int progressPercentage, String joinDate, String maturityDate, int remainingPayments
});




}
/// @nodoc
class __$ActiveSavingsEntityCopyWithImpl<$Res>
    implements _$ActiveSavingsEntityCopyWith<$Res> {
  __$ActiveSavingsEntityCopyWithImpl(this._self, this._then);

  final _ActiveSavingsEntity _self;
  final $Res Function(_ActiveSavingsEntity) _then;

/// Create a copy of ActiveSavingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subscriptionId = null,Object? productName = null,Object? currentAmount = null,Object? progressPercentage = null,Object? joinDate = null,Object? maturityDate = null,Object? remainingPayments = null,}) {
  return _then(_ActiveSavingsEntity(
subscriptionId: null == subscriptionId ? _self.subscriptionId : subscriptionId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,currentAmount: null == currentAmount ? _self.currentAmount : currentAmount // ignore: cast_nullable_to_non_nullable
as int,progressPercentage: null == progressPercentage ? _self.progressPercentage : progressPercentage // ignore: cast_nullable_to_non_nullable
as int,joinDate: null == joinDate ? _self.joinDate : joinDate // ignore: cast_nullable_to_non_nullable
as String,maturityDate: null == maturityDate ? _self.maturityDate : maturityDate // ignore: cast_nullable_to_non_nullable
as String,remainingPayments: null == remainingPayments ? _self.remainingPayments : remainingPayments // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ActiveSavingsListEntity {

 List<ActiveSavingsEntity> get activeSavings;
/// Create a copy of ActiveSavingsListEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActiveSavingsListEntityCopyWith<ActiveSavingsListEntity> get copyWith => _$ActiveSavingsListEntityCopyWithImpl<ActiveSavingsListEntity>(this as ActiveSavingsListEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActiveSavingsListEntity&&const DeepCollectionEquality().equals(other.activeSavings, activeSavings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(activeSavings));

@override
String toString() {
  return 'ActiveSavingsListEntity(activeSavings: $activeSavings)';
}


}

/// @nodoc
abstract mixin class $ActiveSavingsListEntityCopyWith<$Res>  {
  factory $ActiveSavingsListEntityCopyWith(ActiveSavingsListEntity value, $Res Function(ActiveSavingsListEntity) _then) = _$ActiveSavingsListEntityCopyWithImpl;
@useResult
$Res call({
 List<ActiveSavingsEntity> activeSavings
});




}
/// @nodoc
class _$ActiveSavingsListEntityCopyWithImpl<$Res>
    implements $ActiveSavingsListEntityCopyWith<$Res> {
  _$ActiveSavingsListEntityCopyWithImpl(this._self, this._then);

  final ActiveSavingsListEntity _self;
  final $Res Function(ActiveSavingsListEntity) _then;

/// Create a copy of ActiveSavingsListEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeSavings = null,}) {
  return _then(_self.copyWith(
activeSavings: null == activeSavings ? _self.activeSavings : activeSavings // ignore: cast_nullable_to_non_nullable
as List<ActiveSavingsEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ActiveSavingsListEntity].
extension ActiveSavingsListEntityPatterns on ActiveSavingsListEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActiveSavingsListEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActiveSavingsListEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActiveSavingsListEntity value)  $default,){
final _that = this;
switch (_that) {
case _ActiveSavingsListEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActiveSavingsListEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ActiveSavingsListEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ActiveSavingsEntity> activeSavings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActiveSavingsListEntity() when $default != null:
return $default(_that.activeSavings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ActiveSavingsEntity> activeSavings)  $default,) {final _that = this;
switch (_that) {
case _ActiveSavingsListEntity():
return $default(_that.activeSavings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ActiveSavingsEntity> activeSavings)?  $default,) {final _that = this;
switch (_that) {
case _ActiveSavingsListEntity() when $default != null:
return $default(_that.activeSavings);case _:
  return null;

}
}

}

/// @nodoc


class _ActiveSavingsListEntity implements ActiveSavingsListEntity {
  const _ActiveSavingsListEntity({required final  List<ActiveSavingsEntity> activeSavings}): _activeSavings = activeSavings;
  

 final  List<ActiveSavingsEntity> _activeSavings;
@override List<ActiveSavingsEntity> get activeSavings {
  if (_activeSavings is EqualUnmodifiableListView) return _activeSavings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeSavings);
}


/// Create a copy of ActiveSavingsListEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActiveSavingsListEntityCopyWith<_ActiveSavingsListEntity> get copyWith => __$ActiveSavingsListEntityCopyWithImpl<_ActiveSavingsListEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActiveSavingsListEntity&&const DeepCollectionEquality().equals(other._activeSavings, _activeSavings));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_activeSavings));

@override
String toString() {
  return 'ActiveSavingsListEntity(activeSavings: $activeSavings)';
}


}

/// @nodoc
abstract mixin class _$ActiveSavingsListEntityCopyWith<$Res> implements $ActiveSavingsListEntityCopyWith<$Res> {
  factory _$ActiveSavingsListEntityCopyWith(_ActiveSavingsListEntity value, $Res Function(_ActiveSavingsListEntity) _then) = __$ActiveSavingsListEntityCopyWithImpl;
@override @useResult
$Res call({
 List<ActiveSavingsEntity> activeSavings
});




}
/// @nodoc
class __$ActiveSavingsListEntityCopyWithImpl<$Res>
    implements _$ActiveSavingsListEntityCopyWith<$Res> {
  __$ActiveSavingsListEntityCopyWithImpl(this._self, this._then);

  final _ActiveSavingsListEntity _self;
  final $Res Function(_ActiveSavingsListEntity) _then;

/// Create a copy of ActiveSavingsListEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeSavings = null,}) {
  return _then(_ActiveSavingsListEntity(
activeSavings: null == activeSavings ? _self._activeSavings : activeSavings // ignore: cast_nullable_to_non_nullable
as List<ActiveSavingsEntity>,
  ));
}


}

// dart format on
