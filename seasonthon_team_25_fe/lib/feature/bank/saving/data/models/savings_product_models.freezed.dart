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

// dart format on
