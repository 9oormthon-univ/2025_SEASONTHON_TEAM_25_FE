// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_maturity_preview_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsMaturityPreviewEntity {

 SavingsMaturityInfoEntity get ourService; SavingsMaturityInfoEntity get preferentialRate;
/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsMaturityPreviewEntityCopyWith<SavingsMaturityPreviewEntity> get copyWith => _$SavingsMaturityPreviewEntityCopyWithImpl<SavingsMaturityPreviewEntity>(this as SavingsMaturityPreviewEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsMaturityPreviewEntity&&(identical(other.ourService, ourService) || other.ourService == ourService)&&(identical(other.preferentialRate, preferentialRate) || other.preferentialRate == preferentialRate));
}


@override
int get hashCode => Object.hash(runtimeType,ourService,preferentialRate);

@override
String toString() {
  return 'SavingsMaturityPreviewEntity(ourService: $ourService, preferentialRate: $preferentialRate)';
}


}

/// @nodoc
abstract mixin class $SavingsMaturityPreviewEntityCopyWith<$Res>  {
  factory $SavingsMaturityPreviewEntityCopyWith(SavingsMaturityPreviewEntity value, $Res Function(SavingsMaturityPreviewEntity) _then) = _$SavingsMaturityPreviewEntityCopyWithImpl;
@useResult
$Res call({
 SavingsMaturityInfoEntity ourService, SavingsMaturityInfoEntity preferentialRate
});


$SavingsMaturityInfoEntityCopyWith<$Res> get ourService;$SavingsMaturityInfoEntityCopyWith<$Res> get preferentialRate;

}
/// @nodoc
class _$SavingsMaturityPreviewEntityCopyWithImpl<$Res>
    implements $SavingsMaturityPreviewEntityCopyWith<$Res> {
  _$SavingsMaturityPreviewEntityCopyWithImpl(this._self, this._then);

  final SavingsMaturityPreviewEntity _self;
  final $Res Function(SavingsMaturityPreviewEntity) _then;

/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ourService = null,Object? preferentialRate = null,}) {
  return _then(_self.copyWith(
ourService: null == ourService ? _self.ourService : ourService // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoEntity,preferentialRate: null == preferentialRate ? _self.preferentialRate : preferentialRate // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoEntity,
  ));
}
/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoEntityCopyWith<$Res> get ourService {
  
  return $SavingsMaturityInfoEntityCopyWith<$Res>(_self.ourService, (value) {
    return _then(_self.copyWith(ourService: value));
  });
}/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoEntityCopyWith<$Res> get preferentialRate {
  
  return $SavingsMaturityInfoEntityCopyWith<$Res>(_self.preferentialRate, (value) {
    return _then(_self.copyWith(preferentialRate: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavingsMaturityPreviewEntity].
extension SavingsMaturityPreviewEntityPatterns on SavingsMaturityPreviewEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsMaturityPreviewEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsMaturityPreviewEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsMaturityPreviewEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SavingsMaturityInfoEntity ourService,  SavingsMaturityInfoEntity preferentialRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity() when $default != null:
return $default(_that.ourService,_that.preferentialRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SavingsMaturityInfoEntity ourService,  SavingsMaturityInfoEntity preferentialRate)  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity():
return $default(_that.ourService,_that.preferentialRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SavingsMaturityInfoEntity ourService,  SavingsMaturityInfoEntity preferentialRate)?  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewEntity() when $default != null:
return $default(_that.ourService,_that.preferentialRate);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsMaturityPreviewEntity implements SavingsMaturityPreviewEntity {
  const _SavingsMaturityPreviewEntity({required this.ourService, required this.preferentialRate});
  

@override final  SavingsMaturityInfoEntity ourService;
@override final  SavingsMaturityInfoEntity preferentialRate;

/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsMaturityPreviewEntityCopyWith<_SavingsMaturityPreviewEntity> get copyWith => __$SavingsMaturityPreviewEntityCopyWithImpl<_SavingsMaturityPreviewEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsMaturityPreviewEntity&&(identical(other.ourService, ourService) || other.ourService == ourService)&&(identical(other.preferentialRate, preferentialRate) || other.preferentialRate == preferentialRate));
}


@override
int get hashCode => Object.hash(runtimeType,ourService,preferentialRate);

@override
String toString() {
  return 'SavingsMaturityPreviewEntity(ourService: $ourService, preferentialRate: $preferentialRate)';
}


}

/// @nodoc
abstract mixin class _$SavingsMaturityPreviewEntityCopyWith<$Res> implements $SavingsMaturityPreviewEntityCopyWith<$Res> {
  factory _$SavingsMaturityPreviewEntityCopyWith(_SavingsMaturityPreviewEntity value, $Res Function(_SavingsMaturityPreviewEntity) _then) = __$SavingsMaturityPreviewEntityCopyWithImpl;
@override @useResult
$Res call({
 SavingsMaturityInfoEntity ourService, SavingsMaturityInfoEntity preferentialRate
});


@override $SavingsMaturityInfoEntityCopyWith<$Res> get ourService;@override $SavingsMaturityInfoEntityCopyWith<$Res> get preferentialRate;

}
/// @nodoc
class __$SavingsMaturityPreviewEntityCopyWithImpl<$Res>
    implements _$SavingsMaturityPreviewEntityCopyWith<$Res> {
  __$SavingsMaturityPreviewEntityCopyWithImpl(this._self, this._then);

  final _SavingsMaturityPreviewEntity _self;
  final $Res Function(_SavingsMaturityPreviewEntity) _then;

/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ourService = null,Object? preferentialRate = null,}) {
  return _then(_SavingsMaturityPreviewEntity(
ourService: null == ourService ? _self.ourService : ourService // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoEntity,preferentialRate: null == preferentialRate ? _self.preferentialRate : preferentialRate // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoEntity,
  ));
}

/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoEntityCopyWith<$Res> get ourService {
  
  return $SavingsMaturityInfoEntityCopyWith<$Res>(_self.ourService, (value) {
    return _then(_self.copyWith(ourService: value));
  });
}/// Create a copy of SavingsMaturityPreviewEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoEntityCopyWith<$Res> get preferentialRate {
  
  return $SavingsMaturityInfoEntityCopyWith<$Res>(_self.preferentialRate, (value) {
    return _then(_self.copyWith(preferentialRate: value));
  });
}
}

/// @nodoc
mixin _$SavingsMaturityInfoEntity {

 int get principal; int get interest; int get tax; int get totalAmount; double get interestRate;
/// Create a copy of SavingsMaturityInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsMaturityInfoEntityCopyWith<SavingsMaturityInfoEntity> get copyWith => _$SavingsMaturityInfoEntityCopyWithImpl<SavingsMaturityInfoEntity>(this as SavingsMaturityInfoEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsMaturityInfoEntity&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate));
}


@override
int get hashCode => Object.hash(runtimeType,principal,interest,tax,totalAmount,interestRate);

@override
String toString() {
  return 'SavingsMaturityInfoEntity(principal: $principal, interest: $interest, tax: $tax, totalAmount: $totalAmount, interestRate: $interestRate)';
}


}

/// @nodoc
abstract mixin class $SavingsMaturityInfoEntityCopyWith<$Res>  {
  factory $SavingsMaturityInfoEntityCopyWith(SavingsMaturityInfoEntity value, $Res Function(SavingsMaturityInfoEntity) _then) = _$SavingsMaturityInfoEntityCopyWithImpl;
@useResult
$Res call({
 int principal, int interest, int tax, int totalAmount, double interestRate
});




}
/// @nodoc
class _$SavingsMaturityInfoEntityCopyWithImpl<$Res>
    implements $SavingsMaturityInfoEntityCopyWith<$Res> {
  _$SavingsMaturityInfoEntityCopyWithImpl(this._self, this._then);

  final SavingsMaturityInfoEntity _self;
  final $Res Function(SavingsMaturityInfoEntity) _then;

/// Create a copy of SavingsMaturityInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? principal = null,Object? interest = null,Object? tax = null,Object? totalAmount = null,Object? interestRate = null,}) {
  return _then(_self.copyWith(
principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as int,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsMaturityInfoEntity].
extension SavingsMaturityInfoEntityPatterns on SavingsMaturityInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsMaturityInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsMaturityInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsMaturityInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int principal,  int interest,  int tax,  int totalAmount,  double interestRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity() when $default != null:
return $default(_that.principal,_that.interest,_that.tax,_that.totalAmount,_that.interestRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int principal,  int interest,  int tax,  int totalAmount,  double interestRate)  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity():
return $default(_that.principal,_that.interest,_that.tax,_that.totalAmount,_that.interestRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int principal,  int interest,  int tax,  int totalAmount,  double interestRate)?  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoEntity() when $default != null:
return $default(_that.principal,_that.interest,_that.tax,_that.totalAmount,_that.interestRate);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsMaturityInfoEntity implements SavingsMaturityInfoEntity {
  const _SavingsMaturityInfoEntity({required this.principal, required this.interest, required this.tax, required this.totalAmount, required this.interestRate});
  

@override final  int principal;
@override final  int interest;
@override final  int tax;
@override final  int totalAmount;
@override final  double interestRate;

/// Create a copy of SavingsMaturityInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsMaturityInfoEntityCopyWith<_SavingsMaturityInfoEntity> get copyWith => __$SavingsMaturityInfoEntityCopyWithImpl<_SavingsMaturityInfoEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsMaturityInfoEntity&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate));
}


@override
int get hashCode => Object.hash(runtimeType,principal,interest,tax,totalAmount,interestRate);

@override
String toString() {
  return 'SavingsMaturityInfoEntity(principal: $principal, interest: $interest, tax: $tax, totalAmount: $totalAmount, interestRate: $interestRate)';
}


}

/// @nodoc
abstract mixin class _$SavingsMaturityInfoEntityCopyWith<$Res> implements $SavingsMaturityInfoEntityCopyWith<$Res> {
  factory _$SavingsMaturityInfoEntityCopyWith(_SavingsMaturityInfoEntity value, $Res Function(_SavingsMaturityInfoEntity) _then) = __$SavingsMaturityInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 int principal, int interest, int tax, int totalAmount, double interestRate
});




}
/// @nodoc
class __$SavingsMaturityInfoEntityCopyWithImpl<$Res>
    implements _$SavingsMaturityInfoEntityCopyWith<$Res> {
  __$SavingsMaturityInfoEntityCopyWithImpl(this._self, this._then);

  final _SavingsMaturityInfoEntity _self;
  final $Res Function(_SavingsMaturityInfoEntity) _then;

/// Create a copy of SavingsMaturityInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? principal = null,Object? interest = null,Object? tax = null,Object? totalAmount = null,Object? interestRate = null,}) {
  return _then(_SavingsMaturityInfoEntity(
principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as int,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
