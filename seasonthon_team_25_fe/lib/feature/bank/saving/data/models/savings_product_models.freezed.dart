// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_product_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SavingsProductResponse {

 List<SavingsProductModel> get content; List<String> get bankNames;
/// Create a copy of SavingsProductResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductResponseCopyWith<SavingsProductResponse> get copyWith => _$SavingsProductResponseCopyWithImpl<SavingsProductResponse>(this as SavingsProductResponse, _$identity);

  /// Serializes this SavingsProductResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductResponse&&const DeepCollectionEquality().equals(other.content, content)&&const DeepCollectionEquality().equals(other.bankNames, bankNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),const DeepCollectionEquality().hash(bankNames));

@override
String toString() {
  return 'SavingsProductResponse(content: $content, bankNames: $bankNames)';
}


}

/// @nodoc
abstract mixin class $SavingsProductResponseCopyWith<$Res>  {
  factory $SavingsProductResponseCopyWith(SavingsProductResponse value, $Res Function(SavingsProductResponse) _then) = _$SavingsProductResponseCopyWithImpl;
@useResult
$Res call({
 List<SavingsProductModel> content, List<String> bankNames
});




}
/// @nodoc
class _$SavingsProductResponseCopyWithImpl<$Res>
    implements $SavingsProductResponseCopyWith<$Res> {
  _$SavingsProductResponseCopyWithImpl(this._self, this._then);

  final SavingsProductResponse _self;
  final $Res Function(SavingsProductResponse) _then;

/// Create a copy of SavingsProductResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? bankNames = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<SavingsProductModel>,bankNames: null == bankNames ? _self.bankNames : bankNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsProductResponse].
extension SavingsProductResponsePatterns on SavingsProductResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductResponse value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SavingsProductModel> content,  List<String> bankNames)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsProductResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SavingsProductModel> content,  List<String> bankNames)  $default,) {final _that = this;
switch (_that) {
case _SavingsProductResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SavingsProductModel> content,  List<String> bankNames)?  $default,) {final _that = this;
switch (_that) {
case _SavingsProductResponse() when $default != null:
return $default(_that.content,_that.bankNames);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsProductResponse implements SavingsProductResponse {
  const _SavingsProductResponse({required final  List<SavingsProductModel> content, required final  List<String> bankNames}): _content = content,_bankNames = bankNames;
  factory _SavingsProductResponse.fromJson(Map<String, dynamic> json) => _$SavingsProductResponseFromJson(json);

 final  List<SavingsProductModel> _content;
@override List<SavingsProductModel> get content {
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


/// Create a copy of SavingsProductResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductResponseCopyWith<_SavingsProductResponse> get copyWith => __$SavingsProductResponseCopyWithImpl<_SavingsProductResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsProductResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductResponse&&const DeepCollectionEquality().equals(other._content, _content)&&const DeepCollectionEquality().equals(other._bankNames, _bankNames));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),const DeepCollectionEquality().hash(_bankNames));

@override
String toString() {
  return 'SavingsProductResponse(content: $content, bankNames: $bankNames)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductResponseCopyWith<$Res> implements $SavingsProductResponseCopyWith<$Res> {
  factory _$SavingsProductResponseCopyWith(_SavingsProductResponse value, $Res Function(_SavingsProductResponse) _then) = __$SavingsProductResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SavingsProductModel> content, List<String> bankNames
});




}
/// @nodoc
class __$SavingsProductResponseCopyWithImpl<$Res>
    implements _$SavingsProductResponseCopyWith<$Res> {
  __$SavingsProductResponseCopyWithImpl(this._self, this._then);

  final _SavingsProductResponse _self;
  final $Res Function(_SavingsProductResponse) _then;

/// Create a copy of SavingsProductResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? bankNames = null,}) {
  return _then(_SavingsProductResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<SavingsProductModel>,bankNames: null == bankNames ? _self._bankNames : bankNames // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SavingsProductModel {

 int get productSnapshotId; String get productName; String get bankName; String get aiSummary;
/// Create a copy of SavingsProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductModelCopyWith<SavingsProductModel> get copyWith => _$SavingsProductModelCopyWithImpl<SavingsProductModel>(this as SavingsProductModel, _$identity);

  /// Serializes this SavingsProductModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductModel&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,productName,bankName,aiSummary);

@override
String toString() {
  return 'SavingsProductModel(productSnapshotId: $productSnapshotId, productName: $productName, bankName: $bankName, aiSummary: $aiSummary)';
}


}

/// @nodoc
abstract mixin class $SavingsProductModelCopyWith<$Res>  {
  factory $SavingsProductModelCopyWith(SavingsProductModel value, $Res Function(SavingsProductModel) _then) = _$SavingsProductModelCopyWithImpl;
@useResult
$Res call({
 int productSnapshotId, String productName, String bankName, String aiSummary
});




}
/// @nodoc
class _$SavingsProductModelCopyWithImpl<$Res>
    implements $SavingsProductModelCopyWith<$Res> {
  _$SavingsProductModelCopyWithImpl(this._self, this._then);

  final SavingsProductModel _self;
  final $Res Function(SavingsProductModel) _then;

/// Create a copy of SavingsProductModel
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


/// Adds pattern-matching-related methods to [SavingsProductModel].
extension SavingsProductModelPatterns on SavingsProductModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductModel value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductModel value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductModel() when $default != null:
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
case _SavingsProductModel() when $default != null:
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
case _SavingsProductModel():
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
case _SavingsProductModel() when $default != null:
return $default(_that.productSnapshotId,_that.productName,_that.bankName,_that.aiSummary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsProductModel implements SavingsProductModel {
  const _SavingsProductModel({required this.productSnapshotId, required this.productName, required this.bankName, required this.aiSummary});
  factory _SavingsProductModel.fromJson(Map<String, dynamic> json) => _$SavingsProductModelFromJson(json);

@override final  int productSnapshotId;
@override final  String productName;
@override final  String bankName;
@override final  String aiSummary;

/// Create a copy of SavingsProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductModelCopyWith<_SavingsProductModel> get copyWith => __$SavingsProductModelCopyWithImpl<_SavingsProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsProductModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductModel&&(identical(other.productSnapshotId, productSnapshotId) || other.productSnapshotId == productSnapshotId)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productSnapshotId,productName,bankName,aiSummary);

@override
String toString() {
  return 'SavingsProductModel(productSnapshotId: $productSnapshotId, productName: $productName, bankName: $bankName, aiSummary: $aiSummary)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductModelCopyWith<$Res> implements $SavingsProductModelCopyWith<$Res> {
  factory _$SavingsProductModelCopyWith(_SavingsProductModel value, $Res Function(_SavingsProductModel) _then) = __$SavingsProductModelCopyWithImpl;
@override @useResult
$Res call({
 int productSnapshotId, String productName, String bankName, String aiSummary
});




}
/// @nodoc
class __$SavingsProductModelCopyWithImpl<$Res>
    implements _$SavingsProductModelCopyWith<$Res> {
  __$SavingsProductModelCopyWithImpl(this._self, this._then);

  final _SavingsProductModel _self;
  final $Res Function(_SavingsProductModel) _then;

/// Create a copy of SavingsProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productSnapshotId = null,Object? productName = null,Object? bankName = null,Object? aiSummary = null,}) {
  return _then(_SavingsProductModel(
productSnapshotId: null == productSnapshotId ? _self.productSnapshotId : productSnapshotId // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SavingsProductDetailResponse {

 String get productName; String get bankName; String get maturityInterest; String get specialCondition; String get joinDeny; String get joinMember; int? get maxLimit; String get intrRateType; String get intrRateTypeNm; String get rsrvType; String get rsrvTypeNm; List<int> get saveTrm; List<double> get intrRate; List<double> get intrRate2;
/// Create a copy of SavingsProductDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsProductDetailResponseCopyWith<SavingsProductDetailResponse> get copyWith => _$SavingsProductDetailResponseCopyWithImpl<SavingsProductDetailResponse>(this as SavingsProductDetailResponse, _$identity);

  /// Serializes this SavingsProductDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsProductDetailResponse&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maturityInterest, maturityInterest) || other.maturityInterest == maturityInterest)&&(identical(other.specialCondition, specialCondition) || other.specialCondition == specialCondition)&&(identical(other.joinDeny, joinDeny) || other.joinDeny == joinDeny)&&(identical(other.joinMember, joinMember) || other.joinMember == joinMember)&&(identical(other.maxLimit, maxLimit) || other.maxLimit == maxLimit)&&(identical(other.intrRateType, intrRateType) || other.intrRateType == intrRateType)&&(identical(other.intrRateTypeNm, intrRateTypeNm) || other.intrRateTypeNm == intrRateTypeNm)&&(identical(other.rsrvType, rsrvType) || other.rsrvType == rsrvType)&&(identical(other.rsrvTypeNm, rsrvTypeNm) || other.rsrvTypeNm == rsrvTypeNm)&&const DeepCollectionEquality().equals(other.saveTrm, saveTrm)&&const DeepCollectionEquality().equals(other.intrRate, intrRate)&&const DeepCollectionEquality().equals(other.intrRate2, intrRate2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,bankName,maturityInterest,specialCondition,joinDeny,joinMember,maxLimit,intrRateType,intrRateTypeNm,rsrvType,rsrvTypeNm,const DeepCollectionEquality().hash(saveTrm),const DeepCollectionEquality().hash(intrRate),const DeepCollectionEquality().hash(intrRate2));

@override
String toString() {
  return 'SavingsProductDetailResponse(productName: $productName, bankName: $bankName, maturityInterest: $maturityInterest, specialCondition: $specialCondition, joinDeny: $joinDeny, joinMember: $joinMember, maxLimit: $maxLimit, intrRateType: $intrRateType, intrRateTypeNm: $intrRateTypeNm, rsrvType: $rsrvType, rsrvTypeNm: $rsrvTypeNm, saveTrm: $saveTrm, intrRate: $intrRate, intrRate2: $intrRate2)';
}


}

/// @nodoc
abstract mixin class $SavingsProductDetailResponseCopyWith<$Res>  {
  factory $SavingsProductDetailResponseCopyWith(SavingsProductDetailResponse value, $Res Function(SavingsProductDetailResponse) _then) = _$SavingsProductDetailResponseCopyWithImpl;
@useResult
$Res call({
 String productName, String bankName, String maturityInterest, String specialCondition, String joinDeny, String joinMember, int? maxLimit, String intrRateType, String intrRateTypeNm, String rsrvType, String rsrvTypeNm, List<int> saveTrm, List<double> intrRate, List<double> intrRate2
});




}
/// @nodoc
class _$SavingsProductDetailResponseCopyWithImpl<$Res>
    implements $SavingsProductDetailResponseCopyWith<$Res> {
  _$SavingsProductDetailResponseCopyWithImpl(this._self, this._then);

  final SavingsProductDetailResponse _self;
  final $Res Function(SavingsProductDetailResponse) _then;

/// Create a copy of SavingsProductDetailResponse
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


/// Adds pattern-matching-related methods to [SavingsProductDetailResponse].
extension SavingsProductDetailResponsePatterns on SavingsProductDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsProductDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsProductDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsProductDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _SavingsProductDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsProductDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsProductDetailResponse() when $default != null:
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
case _SavingsProductDetailResponse() when $default != null:
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
case _SavingsProductDetailResponse():
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
case _SavingsProductDetailResponse() when $default != null:
return $default(_that.productName,_that.bankName,_that.maturityInterest,_that.specialCondition,_that.joinDeny,_that.joinMember,_that.maxLimit,_that.intrRateType,_that.intrRateTypeNm,_that.rsrvType,_that.rsrvTypeNm,_that.saveTrm,_that.intrRate,_that.intrRate2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsProductDetailResponse implements SavingsProductDetailResponse {
  const _SavingsProductDetailResponse({required this.productName, required this.bankName, required this.maturityInterest, required this.specialCondition, required this.joinDeny, required this.joinMember, this.maxLimit, required this.intrRateType, required this.intrRateTypeNm, required this.rsrvType, required this.rsrvTypeNm, required final  List<int> saveTrm, required final  List<double> intrRate, required final  List<double> intrRate2}): _saveTrm = saveTrm,_intrRate = intrRate,_intrRate2 = intrRate2;
  factory _SavingsProductDetailResponse.fromJson(Map<String, dynamic> json) => _$SavingsProductDetailResponseFromJson(json);

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


/// Create a copy of SavingsProductDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsProductDetailResponseCopyWith<_SavingsProductDetailResponse> get copyWith => __$SavingsProductDetailResponseCopyWithImpl<_SavingsProductDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsProductDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsProductDetailResponse&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.maturityInterest, maturityInterest) || other.maturityInterest == maturityInterest)&&(identical(other.specialCondition, specialCondition) || other.specialCondition == specialCondition)&&(identical(other.joinDeny, joinDeny) || other.joinDeny == joinDeny)&&(identical(other.joinMember, joinMember) || other.joinMember == joinMember)&&(identical(other.maxLimit, maxLimit) || other.maxLimit == maxLimit)&&(identical(other.intrRateType, intrRateType) || other.intrRateType == intrRateType)&&(identical(other.intrRateTypeNm, intrRateTypeNm) || other.intrRateTypeNm == intrRateTypeNm)&&(identical(other.rsrvType, rsrvType) || other.rsrvType == rsrvType)&&(identical(other.rsrvTypeNm, rsrvTypeNm) || other.rsrvTypeNm == rsrvTypeNm)&&const DeepCollectionEquality().equals(other._saveTrm, _saveTrm)&&const DeepCollectionEquality().equals(other._intrRate, _intrRate)&&const DeepCollectionEquality().equals(other._intrRate2, _intrRate2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productName,bankName,maturityInterest,specialCondition,joinDeny,joinMember,maxLimit,intrRateType,intrRateTypeNm,rsrvType,rsrvTypeNm,const DeepCollectionEquality().hash(_saveTrm),const DeepCollectionEquality().hash(_intrRate),const DeepCollectionEquality().hash(_intrRate2));

@override
String toString() {
  return 'SavingsProductDetailResponse(productName: $productName, bankName: $bankName, maturityInterest: $maturityInterest, specialCondition: $specialCondition, joinDeny: $joinDeny, joinMember: $joinMember, maxLimit: $maxLimit, intrRateType: $intrRateType, intrRateTypeNm: $intrRateTypeNm, rsrvType: $rsrvType, rsrvTypeNm: $rsrvTypeNm, saveTrm: $saveTrm, intrRate: $intrRate, intrRate2: $intrRate2)';
}


}

/// @nodoc
abstract mixin class _$SavingsProductDetailResponseCopyWith<$Res> implements $SavingsProductDetailResponseCopyWith<$Res> {
  factory _$SavingsProductDetailResponseCopyWith(_SavingsProductDetailResponse value, $Res Function(_SavingsProductDetailResponse) _then) = __$SavingsProductDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 String productName, String bankName, String maturityInterest, String specialCondition, String joinDeny, String joinMember, int? maxLimit, String intrRateType, String intrRateTypeNm, String rsrvType, String rsrvTypeNm, List<int> saveTrm, List<double> intrRate, List<double> intrRate2
});




}
/// @nodoc
class __$SavingsProductDetailResponseCopyWithImpl<$Res>
    implements _$SavingsProductDetailResponseCopyWith<$Res> {
  __$SavingsProductDetailResponseCopyWithImpl(this._self, this._then);

  final _SavingsProductDetailResponse _self;
  final $Res Function(_SavingsProductDetailResponse) _then;

/// Create a copy of SavingsProductDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productName = null,Object? bankName = null,Object? maturityInterest = null,Object? specialCondition = null,Object? joinDeny = null,Object? joinMember = null,Object? maxLimit = freezed,Object? intrRateType = null,Object? intrRateTypeNm = null,Object? rsrvType = null,Object? rsrvTypeNm = null,Object? saveTrm = null,Object? intrRate = null,Object? intrRate2 = null,}) {
  return _then(_SavingsProductDetailResponse(
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


/// @nodoc
mixin _$SavingsMaturityPreviewResponse {

 SavingsMaturityInfoModel get ourService; SavingsMaturityInfoModel get preferentialRate;
/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsMaturityPreviewResponseCopyWith<SavingsMaturityPreviewResponse> get copyWith => _$SavingsMaturityPreviewResponseCopyWithImpl<SavingsMaturityPreviewResponse>(this as SavingsMaturityPreviewResponse, _$identity);

  /// Serializes this SavingsMaturityPreviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsMaturityPreviewResponse&&(identical(other.ourService, ourService) || other.ourService == ourService)&&(identical(other.preferentialRate, preferentialRate) || other.preferentialRate == preferentialRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ourService,preferentialRate);

@override
String toString() {
  return 'SavingsMaturityPreviewResponse(ourService: $ourService, preferentialRate: $preferentialRate)';
}


}

/// @nodoc
abstract mixin class $SavingsMaturityPreviewResponseCopyWith<$Res>  {
  factory $SavingsMaturityPreviewResponseCopyWith(SavingsMaturityPreviewResponse value, $Res Function(SavingsMaturityPreviewResponse) _then) = _$SavingsMaturityPreviewResponseCopyWithImpl;
@useResult
$Res call({
 SavingsMaturityInfoModel ourService, SavingsMaturityInfoModel preferentialRate
});


$SavingsMaturityInfoModelCopyWith<$Res> get ourService;$SavingsMaturityInfoModelCopyWith<$Res> get preferentialRate;

}
/// @nodoc
class _$SavingsMaturityPreviewResponseCopyWithImpl<$Res>
    implements $SavingsMaturityPreviewResponseCopyWith<$Res> {
  _$SavingsMaturityPreviewResponseCopyWithImpl(this._self, this._then);

  final SavingsMaturityPreviewResponse _self;
  final $Res Function(SavingsMaturityPreviewResponse) _then;

/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ourService = null,Object? preferentialRate = null,}) {
  return _then(_self.copyWith(
ourService: null == ourService ? _self.ourService : ourService // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoModel,preferentialRate: null == preferentialRate ? _self.preferentialRate : preferentialRate // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoModel,
  ));
}
/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoModelCopyWith<$Res> get ourService {
  
  return $SavingsMaturityInfoModelCopyWith<$Res>(_self.ourService, (value) {
    return _then(_self.copyWith(ourService: value));
  });
}/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoModelCopyWith<$Res> get preferentialRate {
  
  return $SavingsMaturityInfoModelCopyWith<$Res>(_self.preferentialRate, (value) {
    return _then(_self.copyWith(preferentialRate: value));
  });
}
}


/// Adds pattern-matching-related methods to [SavingsMaturityPreviewResponse].
extension SavingsMaturityPreviewResponsePatterns on SavingsMaturityPreviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsMaturityPreviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsMaturityPreviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsMaturityPreviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SavingsMaturityInfoModel ourService,  SavingsMaturityInfoModel preferentialRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SavingsMaturityInfoModel ourService,  SavingsMaturityInfoModel preferentialRate)  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SavingsMaturityInfoModel ourService,  SavingsMaturityInfoModel preferentialRate)?  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityPreviewResponse() when $default != null:
return $default(_that.ourService,_that.preferentialRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsMaturityPreviewResponse implements SavingsMaturityPreviewResponse {
  const _SavingsMaturityPreviewResponse({required this.ourService, required this.preferentialRate});
  factory _SavingsMaturityPreviewResponse.fromJson(Map<String, dynamic> json) => _$SavingsMaturityPreviewResponseFromJson(json);

@override final  SavingsMaturityInfoModel ourService;
@override final  SavingsMaturityInfoModel preferentialRate;

/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsMaturityPreviewResponseCopyWith<_SavingsMaturityPreviewResponse> get copyWith => __$SavingsMaturityPreviewResponseCopyWithImpl<_SavingsMaturityPreviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsMaturityPreviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsMaturityPreviewResponse&&(identical(other.ourService, ourService) || other.ourService == ourService)&&(identical(other.preferentialRate, preferentialRate) || other.preferentialRate == preferentialRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ourService,preferentialRate);

@override
String toString() {
  return 'SavingsMaturityPreviewResponse(ourService: $ourService, preferentialRate: $preferentialRate)';
}


}

/// @nodoc
abstract mixin class _$SavingsMaturityPreviewResponseCopyWith<$Res> implements $SavingsMaturityPreviewResponseCopyWith<$Res> {
  factory _$SavingsMaturityPreviewResponseCopyWith(_SavingsMaturityPreviewResponse value, $Res Function(_SavingsMaturityPreviewResponse) _then) = __$SavingsMaturityPreviewResponseCopyWithImpl;
@override @useResult
$Res call({
 SavingsMaturityInfoModel ourService, SavingsMaturityInfoModel preferentialRate
});


@override $SavingsMaturityInfoModelCopyWith<$Res> get ourService;@override $SavingsMaturityInfoModelCopyWith<$Res> get preferentialRate;

}
/// @nodoc
class __$SavingsMaturityPreviewResponseCopyWithImpl<$Res>
    implements _$SavingsMaturityPreviewResponseCopyWith<$Res> {
  __$SavingsMaturityPreviewResponseCopyWithImpl(this._self, this._then);

  final _SavingsMaturityPreviewResponse _self;
  final $Res Function(_SavingsMaturityPreviewResponse) _then;

/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ourService = null,Object? preferentialRate = null,}) {
  return _then(_SavingsMaturityPreviewResponse(
ourService: null == ourService ? _self.ourService : ourService // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoModel,preferentialRate: null == preferentialRate ? _self.preferentialRate : preferentialRate // ignore: cast_nullable_to_non_nullable
as SavingsMaturityInfoModel,
  ));
}

/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoModelCopyWith<$Res> get ourService {
  
  return $SavingsMaturityInfoModelCopyWith<$Res>(_self.ourService, (value) {
    return _then(_self.copyWith(ourService: value));
  });
}/// Create a copy of SavingsMaturityPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SavingsMaturityInfoModelCopyWith<$Res> get preferentialRate {
  
  return $SavingsMaturityInfoModelCopyWith<$Res>(_self.preferentialRate, (value) {
    return _then(_self.copyWith(preferentialRate: value));
  });
}
}


/// @nodoc
mixin _$SavingsMaturityInfoModel {

 int get principal; int get interest; int get tax; double get totalAmount; double get interestRate;
/// Create a copy of SavingsMaturityInfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsMaturityInfoModelCopyWith<SavingsMaturityInfoModel> get copyWith => _$SavingsMaturityInfoModelCopyWithImpl<SavingsMaturityInfoModel>(this as SavingsMaturityInfoModel, _$identity);

  /// Serializes this SavingsMaturityInfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsMaturityInfoModel&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,principal,interest,tax,totalAmount,interestRate);

@override
String toString() {
  return 'SavingsMaturityInfoModel(principal: $principal, interest: $interest, tax: $tax, totalAmount: $totalAmount, interestRate: $interestRate)';
}


}

/// @nodoc
abstract mixin class $SavingsMaturityInfoModelCopyWith<$Res>  {
  factory $SavingsMaturityInfoModelCopyWith(SavingsMaturityInfoModel value, $Res Function(SavingsMaturityInfoModel) _then) = _$SavingsMaturityInfoModelCopyWithImpl;
@useResult
$Res call({
 int principal, int interest, int tax, double totalAmount, double interestRate
});




}
/// @nodoc
class _$SavingsMaturityInfoModelCopyWithImpl<$Res>
    implements $SavingsMaturityInfoModelCopyWith<$Res> {
  _$SavingsMaturityInfoModelCopyWithImpl(this._self, this._then);

  final SavingsMaturityInfoModel _self;
  final $Res Function(SavingsMaturityInfoModel) _then;

/// Create a copy of SavingsMaturityInfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? principal = null,Object? interest = null,Object? tax = null,Object? totalAmount = null,Object? interestRate = null,}) {
  return _then(_self.copyWith(
principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as int,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsMaturityInfoModel].
extension SavingsMaturityInfoModelPatterns on SavingsMaturityInfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsMaturityInfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsMaturityInfoModel value)  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsMaturityInfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int principal,  int interest,  int tax,  double totalAmount,  double interestRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int principal,  int interest,  int tax,  double totalAmount,  double interestRate)  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int principal,  int interest,  int tax,  double totalAmount,  double interestRate)?  $default,) {final _that = this;
switch (_that) {
case _SavingsMaturityInfoModel() when $default != null:
return $default(_that.principal,_that.interest,_that.tax,_that.totalAmount,_that.interestRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SavingsMaturityInfoModel implements SavingsMaturityInfoModel {
  const _SavingsMaturityInfoModel({required this.principal, required this.interest, required this.tax, required this.totalAmount, required this.interestRate});
  factory _SavingsMaturityInfoModel.fromJson(Map<String, dynamic> json) => _$SavingsMaturityInfoModelFromJson(json);

@override final  int principal;
@override final  int interest;
@override final  int tax;
@override final  double totalAmount;
@override final  double interestRate;

/// Create a copy of SavingsMaturityInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsMaturityInfoModelCopyWith<_SavingsMaturityInfoModel> get copyWith => __$SavingsMaturityInfoModelCopyWithImpl<_SavingsMaturityInfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SavingsMaturityInfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsMaturityInfoModel&&(identical(other.principal, principal) || other.principal == principal)&&(identical(other.interest, interest) || other.interest == interest)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.interestRate, interestRate) || other.interestRate == interestRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,principal,interest,tax,totalAmount,interestRate);

@override
String toString() {
  return 'SavingsMaturityInfoModel(principal: $principal, interest: $interest, tax: $tax, totalAmount: $totalAmount, interestRate: $interestRate)';
}


}

/// @nodoc
abstract mixin class _$SavingsMaturityInfoModelCopyWith<$Res> implements $SavingsMaturityInfoModelCopyWith<$Res> {
  factory _$SavingsMaturityInfoModelCopyWith(_SavingsMaturityInfoModel value, $Res Function(_SavingsMaturityInfoModel) _then) = __$SavingsMaturityInfoModelCopyWithImpl;
@override @useResult
$Res call({
 int principal, int interest, int tax, double totalAmount, double interestRate
});




}
/// @nodoc
class __$SavingsMaturityInfoModelCopyWithImpl<$Res>
    implements _$SavingsMaturityInfoModelCopyWith<$Res> {
  __$SavingsMaturityInfoModelCopyWithImpl(this._self, this._then);

  final _SavingsMaturityInfoModel _self;
  final $Res Function(_SavingsMaturityInfoModel) _then;

/// Create a copy of SavingsMaturityInfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? principal = null,Object? interest = null,Object? tax = null,Object? totalAmount = null,Object? interestRate = null,}) {
  return _then(_SavingsMaturityInfoModel(
principal: null == principal ? _self.principal : principal // ignore: cast_nullable_to_non_nullable
as int,interest: null == interest ? _self.interest : interest // ignore: cast_nullable_to_non_nullable
as int,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,interestRate: null == interestRate ? _self.interestRate : interestRate // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
