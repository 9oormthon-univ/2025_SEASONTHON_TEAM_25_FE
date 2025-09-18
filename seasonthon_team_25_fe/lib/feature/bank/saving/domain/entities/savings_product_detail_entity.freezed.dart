// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_product_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsProductDetailEntity {

 String get productName; String get bankName; String get maturityInterest; String get specialCondition; String get joinDeny; String get joinMember; int? get maxLimit; String get intrRateType; String get intrRateTypeNm; String get rsrvType; String get rsrvTypeNm; List<int> get saveTrm; List<double> get intrRate; List<double> get intrRate2;
/// Create a copy of SavingsProductDetailEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductDetailEntityCopyWith<SavingsProductDetailEntity> get copyWith => _$SavingsProductDetailEntityCopyWithImpl<SavingsProductDetailEntity>(this as SavingsProductDetailEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductDetailEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maturityInterest, maturityInterest) || other.maturityInterest == maturityInterest)&&(identical(other.specialCondition, specialCondition) || other.specialCondition == specialCondition)&&(identical(other.joinDeny, joinDeny) || other.joinDeny == joinDeny)&&(identical(other.joinMember, joinMember) || other.joinMember == joinMember)&&(identical(other.maxLimit, maxLimit) || other.maxLimit == maxLimit)&&(identical(other.intrRateType, intrRateType) || other.intrRateType == intrRateType)&&(identical(other.intrRateTypeNm, intrRateTypeNm) || other.intrRateTypeNm == intrRateTypeNm)&&(identical(other.rsrvType, rsrvType) || other.rsrvType == rsrvType)&&(identical(other.rsrvTypeNm, rsrvTypeNm) || other.rsrvTypeNm == rsrvTypeNm)&&const DeepCollectionEquality().equals(other.saveTrm, saveTrm)&&const DeepCollectionEquality().equals(other.intrRate, intrRate)&&const DeepCollectionEquality().equals(other.intrRate2, intrRate2));
}


@override
int get hashCode => Object.hash(runtimeType,productName,bankName,maturityInterest,specialCondition,joinDeny,joinMember,maxLimit,intrRateType,intrRateTypeNm,rsrvType,rsrvTypeNm,const DeepCollectionEquality().hash(saveTrm),const DeepCollectionEquality().hash(intrRate),const DeepCollectionEquality().hash(intrRate2));

@override
String toString() {
  return 'SavingsProductDetailEntity(productName: $productName, bankName: $bankName, maturityInterest: $maturityInterest, specialCondition: $specialCondition, joinDeny: $joinDeny, joinMember: $joinMember, maxLimit: $maxLimit, intrRateType: $intrRateType, intrRateTypeNm: $intrRateTypeNm, rsrvType: $rsrvType, rsrvTypeNm: $rsrvTypeNm, saveTrm: $saveTrm, intrRate: $intrRate, intrRate2: $intrRate2)';
}


}

/// @nodoc
abstract mixin class $SavingsProductDetailEntityCopyWith<$Res>  {
  factory $SavingsProductDetailEntityCopyWith(SavingsProductDetailEntity value, $Res Function(SavingsProductDetailEntity) _then) = _$SavingsProductDetailEntityCopyWithImpl;
@useResult
$Res call({
 String productName, String bankName, String maturityInterest, String specialCondition, String joinDeny, String joinMember, int? maxLimit, String intrRateType, String intrRateTypeNm, String rsrvType, String rsrvTypeNm, List<int> saveTrm, List<double> intrRate, List<double> intrRate2
});




}
/// @nodoc
class _$SavingsProductDetailEntityCopyWithImpl<$Res>
    implements $SavingsProductDetailEntityCopyWith<$Res> {
  _$SavingsProductDetailEntityCopyWithImpl(this._self, this._then);

  final SavingsProductDetailEntity _self;
  final $Res Function(SavingsProductDetailEntity) _then;

/// Create a copy of SavingsProductDetailEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productName = null,Object? bankName = null,Object? maturityInterest = null,Object? specialCondition = null,Object? joinDeny = null,Object? joinMember = null,Object? maxLimit = freezed,Object? intrRateType = null,Object? intrRateTypeNm = null,Object? rsrvType = null,Object? rsrvTypeNm = null,Object? saveTrm = null,Object? intrRate = null,Object? intrRate2 = null,}) {
  return _then(_self.copyWith(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,maturityInterest: null == maturityInterest ? _self.maturityInterest : maturityInterest // ignore: cast_nullable_to_non_nullable
as String,specialCondition: null == specialCondition ? _self.specialCondition : specialCondition // ignore: cast_nullable_to_non_nullable
as String,joinDeny: null == joinDeny ? _self.joinDeny : joinDeny // ignore: cast_nullable_to_non_nullable
as String,joinMember: null == joinMember ? _self.joinMember : joinMember // ignore: cast_nullable_to_non_nullable
as String,maxLimit: freezed == maxLimit ? _self.maxLimit : maxLimit // ignore: cast_nullable_to_non_nullable
as int?,intrRateType: null == intrRateType ? _self.intrRateType : intrRateType // ignore: cast_nullable_to_non_nullable
as String,intrRateTypeNm: null == intrRateTypeNm ? _self.intrRateTypeNm : intrRateTypeNm // ignore: cast_nullable_to_non_nullable
as String,rsrvType: null == rsrvType ? _self.rsrvType : rsrvType // ignore: cast_nullable_to_non_nullable
as String,rsrvTypeNm: null == rsrvTypeNm ? _self.rsrvTypeNm : rsrvTypeNm // ignore: cast_nullable_to_non_nullable
as String,saveTrm: null == saveTrm ? _self.saveTrm : saveTrm // ignore: cast_nullable_to_non_nullable
as List<int>,intrRate: null == intrRate ? _self.intrRate : intrRate // ignore: cast_nullable_to_non_nullable
as List<double>,intrRate2: null == intrRate2 ? _self.intrRate2 : intrRate2 // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsProductDetailEntity].
extension SavingsProductDetailEntityPatterns on SavingsProductDetailEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductDetailEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductDetailEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductDetailEntity value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductDetailEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductDetailEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductDetailEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String productName,  String bankName,  String maturityInterest,  String specialCondition,  String joinDeny,  String joinMember,  int? maxLimit,  String intrRateType,  String intrRateTypeNm,  String rsrvType,  String rsrvTypeNm,  List<int> saveTrm,  List<double> intrRate,  List<double> intrRate2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsProductDetailEntity() when $default != null:
return $default(_that.productName,_that.bankName,_that.maturityInterest,_that.specialCondition,_that.joinDeny,_that.joinMember,_that.maxLimit,_that.intrRateType,_that.intrRateTypeNm,_that.rsrvType,_that.rsrvTypeNm,_that.saveTrm,_that.intrRate,_that.intrRate2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String productName,  String bankName,  String maturityInterest,  String specialCondition,  String joinDeny,  String joinMember,  int? maxLimit,  String intrRateType,  String intrRateTypeNm,  String rsrvType,  String rsrvTypeNm,  List<int> saveTrm,  List<double> intrRate,  List<double> intrRate2)  $default,) {final _that = this;
switch (_that) {
case _SavingsProductDetailEntity():
return $default(_that.productName,_that.bankName,_that.maturityInterest,_that.specialCondition,_that.joinDeny,_that.joinMember,_that.maxLimit,_that.intrRateType,_that.intrRateTypeNm,_that.rsrvType,_that.rsrvTypeNm,_that.saveTrm,_that.intrRate,_that.intrRate2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String productName,  String bankName,  String maturityInterest,  String specialCondition,  String joinDeny,  String joinMember,  int? maxLimit,  String intrRateType,  String intrRateTypeNm,  String rsrvType,  String rsrvTypeNm,  List<int> saveTrm,  List<double> intrRate,  List<double> intrRate2)?  $default,) {final _that = this;
switch (_that) {
case _SavingsProductDetailEntity() when $default != null:
return $default(_that.productName,_that.bankName,_that.maturityInterest,_that.specialCondition,_that.joinDeny,_that.joinMember,_that.maxLimit,_that.intrRateType,_that.intrRateTypeNm,_that.rsrvType,_that.rsrvTypeNm,_that.saveTrm,_that.intrRate,_that.intrRate2);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsProductDetailEntity implements SavingsProductDetailEntity {
  const _SavingsProductDetailEntity({required this.productName, required this.bankName, required this.maturityInterest, required this.specialCondition, required this.joinDeny, required this.joinMember, this.maxLimit, required this.intrRateType, required this.intrRateTypeNm, required this.rsrvType, required this.rsrvTypeNm, required final  List<int> saveTrm, required final  List<double> intrRate, required final  List<double> intrRate2}): _saveTrm = saveTrm,_intrRate = intrRate,_intrRate2 = intrRate2;
  

@override final  String productName;
@override final  String bankName;
@override final  String maturityInterest;
@override final  String specialCondition;
@override final  String joinDeny;
@override final  String joinMember;
@override final  int? maxLimit;
@override final  String intrRateType;
@override final  String intrRateTypeNm;
@override final  String rsrvType;
@override final  String rsrvTypeNm;
 final  List<int> _saveTrm;
@override List<int> get saveTrm {
  if (_saveTrm is EqualUnmodifiableListView) return _saveTrm;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_saveTrm);
}

 final  List<double> _intrRate;
@override List<double> get intrRate {
  if (_intrRate is EqualUnmodifiableListView) return _intrRate;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intrRate);
}

 final  List<double> _intrRate2;
@override List<double> get intrRate2 {
  if (_intrRate2 is EqualUnmodifiableListView) return _intrRate2;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intrRate2);
}


/// Create a copy of SavingsProductDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductDetailEntityCopyWith<_SavingsProductDetailEntity> get copyWith => __$SavingsProductDetailEntityCopyWithImpl<_SavingsProductDetailEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductDetailEntity&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maturityInterest, maturityInterest) || other.maturityInterest == maturityInterest)&&(identical(other.specialCondition, specialCondition) || other.specialCondition == specialCondition)&&(identical(other.joinDeny, joinDeny) || other.joinDeny == joinDeny)&&(identical(other.joinMember, joinMember) || other.joinMember == joinMember)&&(identical(other.maxLimit, maxLimit) || other.maxLimit == maxLimit)&&(identical(other.intrRateType, intrRateType) || other.intrRateType == intrRateType)&&(identical(other.intrRateTypeNm, intrRateTypeNm) || other.intrRateTypeNm == intrRateTypeNm)&&(identical(other.rsrvType, rsrvType) || other.rsrvType == rsrvType)&&(identical(other.rsrvTypeNm, rsrvTypeNm) || other.rsrvTypeNm == rsrvTypeNm)&&const DeepCollectionEquality().equals(other._saveTrm, _saveTrm)&&const DeepCollectionEquality().equals(other._intrRate, _intrRate)&&const DeepCollectionEquality().equals(other._intrRate2, _intrRate2));
}


@override
int get hashCode => Object.hash(runtimeType,productName,bankName,maturityInterest,specialCondition,joinDeny,joinMember,maxLimit,intrRateType,intrRateTypeNm,rsrvType,rsrvTypeNm,const DeepCollectionEquality().hash(_saveTrm),const DeepCollectionEquality().hash(_intrRate),const DeepCollectionEquality().hash(_intrRate2));

@override
String toString() {
  return 'SavingsProductDetailEntity(productName: $productName, bankName: $bankName, maturityInterest: $maturityInterest, specialCondition: $specialCondition, joinDeny: $joinDeny, joinMember: $joinMember, maxLimit: $maxLimit, intrRateType: $intrRateType, intrRateTypeNm: $intrRateTypeNm, rsrvType: $rsrvType, rsrvTypeNm: $rsrvTypeNm, saveTrm: $saveTrm, intrRate: $intrRate, intrRate2: $intrRate2)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductDetailEntityCopyWith<$Res> implements $SavingsProductDetailEntityCopyWith<$Res> {
  factory _$SavingsProductDetailEntityCopyWith(_SavingsProductDetailEntity value, $Res Function(_SavingsProductDetailEntity) _then) = __$SavingsProductDetailEntityCopyWithImpl;
@override @useResult
$Res call({
 String productName, String bankName, String maturityInterest, String specialCondition, String joinDeny, String joinMember, int? maxLimit, String intrRateType, String intrRateTypeNm, String rsrvType, String rsrvTypeNm, List<int> saveTrm, List<double> intrRate, List<double> intrRate2
});




}
/// @nodoc
class __$SavingsProductDetailEntityCopyWithImpl<$Res>
    implements _$SavingsProductDetailEntityCopyWith<$Res> {
  __$SavingsProductDetailEntityCopyWithImpl(this._self, this._then);

  final _SavingsProductDetailEntity _self;
  final $Res Function(_SavingsProductDetailEntity) _then;

/// Create a copy of SavingsProductDetailEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? bankName = null,Object? maturityInterest = null,Object? specialCondition = null,Object? joinDeny = null,Object? joinMember = null,Object? maxLimit = freezed,Object? intrRateType = null,Object? intrRateTypeNm = null,Object? rsrvType = null,Object? rsrvTypeNm = null,Object? saveTrm = null,Object? intrRate = null,Object? intrRate2 = null,}) {
  return _then(_SavingsProductDetailEntity(
productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,maturityInterest: null == maturityInterest ? _self.maturityInterest : maturityInterest // ignore: cast_nullable_to_non_nullable
as String,specialCondition: null == specialCondition ? _self.specialCondition : specialCondition // ignore: cast_nullable_to_non_nullable
as String,joinDeny: null == joinDeny ? _self.joinDeny : joinDeny // ignore: cast_nullable_to_non_nullable
as String,joinMember: null == joinMember ? _self.joinMember : joinMember // ignore: cast_nullable_to_non_nullable
as String,maxLimit: freezed == maxLimit ? _self.maxLimit : maxLimit // ignore: cast_nullable_to_non_nullable
as int?,intrRateType: null == intrRateType ? _self.intrRateType : intrRateType // ignore: cast_nullable_to_non_nullable
as String,intrRateTypeNm: null == intrRateTypeNm ? _self.intrRateTypeNm : intrRateTypeNm // ignore: cast_nullable_to_non_nullable
as String,rsrvType: null == rsrvType ? _self.rsrvType : rsrvType // ignore: cast_nullable_to_non_nullable
as String,rsrvTypeNm: null == rsrvTypeNm ? _self.rsrvTypeNm : rsrvTypeNm // ignore: cast_nullable_to_non_nullable
as String,saveTrm: null == saveTrm ? _self._saveTrm : saveTrm // ignore: cast_nullable_to_non_nullable
as List<int>,intrRate: null == intrRate ? _self._intrRate : intrRate // ignore: cast_nullable_to_non_nullable
as List<double>,intrRate2: null == intrRate2 ? _self._intrRate2 : intrRate2 // ignore: cast_nullable_to_non_nullable
as List<double>,
  ));
}


}

// dart format on
