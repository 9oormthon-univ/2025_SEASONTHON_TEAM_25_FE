// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsItemDto {

 int get id; String get newsItemId; String get title; String get subTitle1; String get subTitle2; String get subTitle3; DateTime get approveDate; DateTime get modifyDate; String get thumbnailUrl; String get originalImgUrl; String get aiSummary; String get plainTextContent; String get ministerCode;
/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsItemDtoCopyWith<NewsItemDto> get copyWith => _$NewsItemDtoCopyWithImpl<NewsItemDto>(this as NewsItemDto, _$identity);

  /// Serializes this NewsItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.newsItemId, newsItemId) || other.newsItemId == newsItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle1, subTitle1) || other.subTitle1 == subTitle1)&&(identical(other.subTitle2, subTitle2) || other.subTitle2 == subTitle2)&&(identical(other.subTitle3, subTitle3) || other.subTitle3 == subTitle3)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.modifyDate, modifyDate) || other.modifyDate == modifyDate)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.originalImgUrl, originalImgUrl) || other.originalImgUrl == originalImgUrl)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.plainTextContent, plainTextContent) || other.plainTextContent == plainTextContent)&&(identical(other.ministerCode, ministerCode) || other.ministerCode == ministerCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,newsItemId,title,subTitle1,subTitle2,subTitle3,approveDate,modifyDate,thumbnailUrl,originalImgUrl,aiSummary,plainTextContent,ministerCode);

@override
String toString() {
  return 'NewsItemDto(id: $id, newsItemId: $newsItemId, title: $title, subTitle1: $subTitle1, subTitle2: $subTitle2, subTitle3: $subTitle3, approveDate: $approveDate, modifyDate: $modifyDate, thumbnailUrl: $thumbnailUrl, originalImgUrl: $originalImgUrl, aiSummary: $aiSummary, plainTextContent: $plainTextContent, ministerCode: $ministerCode)';
}


}

/// @nodoc
abstract mixin class $NewsItemDtoCopyWith<$Res>  {
  factory $NewsItemDtoCopyWith(NewsItemDto value, $Res Function(NewsItemDto) _then) = _$NewsItemDtoCopyWithImpl;
@useResult
$Res call({
 int id, String newsItemId, String title, String subTitle1, String subTitle2, String subTitle3, DateTime approveDate, DateTime modifyDate, String thumbnailUrl, String originalImgUrl, String aiSummary, String plainTextContent, String ministerCode
});




}
/// @nodoc
class _$NewsItemDtoCopyWithImpl<$Res>
    implements $NewsItemDtoCopyWith<$Res> {
  _$NewsItemDtoCopyWithImpl(this._self, this._then);

  final NewsItemDto _self;
  final $Res Function(NewsItemDto) _then;

/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? newsItemId = null,Object? title = null,Object? subTitle1 = null,Object? subTitle2 = null,Object? subTitle3 = null,Object? approveDate = null,Object? modifyDate = null,Object? thumbnailUrl = null,Object? originalImgUrl = null,Object? aiSummary = null,Object? plainTextContent = null,Object? ministerCode = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,newsItemId: null == newsItemId ? _self.newsItemId : newsItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle1: null == subTitle1 ? _self.subTitle1 : subTitle1 // ignore: cast_nullable_to_non_nullable
as String,subTitle2: null == subTitle2 ? _self.subTitle2 : subTitle2 // ignore: cast_nullable_to_non_nullable
as String,subTitle3: null == subTitle3 ? _self.subTitle3 : subTitle3 // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as DateTime,modifyDate: null == modifyDate ? _self.modifyDate : modifyDate // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,originalImgUrl: null == originalImgUrl ? _self.originalImgUrl : originalImgUrl // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,plainTextContent: null == plainTextContent ? _self.plainTextContent : plainTextContent // ignore: cast_nullable_to_non_nullable
as String,ministerCode: null == ministerCode ? _self.ministerCode : ministerCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsItemDto].
extension NewsItemDtoPatterns on NewsItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsItemDto value)  $default,){
final _that = this;
switch (_that) {
case _NewsItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String newsItemId,  String title,  String subTitle1,  String subTitle2,  String subTitle3,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
return $default(_that.id,_that.newsItemId,_that.title,_that.subTitle1,_that.subTitle2,_that.subTitle3,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String newsItemId,  String title,  String subTitle1,  String subTitle2,  String subTitle3,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode)  $default,) {final _that = this;
switch (_that) {
case _NewsItemDto():
return $default(_that.id,_that.newsItemId,_that.title,_that.subTitle1,_that.subTitle2,_that.subTitle3,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String newsItemId,  String title,  String subTitle1,  String subTitle2,  String subTitle3,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode)?  $default,) {final _that = this;
switch (_that) {
case _NewsItemDto() when $default != null:
return $default(_that.id,_that.newsItemId,_that.title,_that.subTitle1,_that.subTitle2,_that.subTitle3,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsItemDto implements NewsItemDto {
  const _NewsItemDto({required this.id, required this.newsItemId, required this.title, required this.subTitle1, required this.subTitle2, required this.subTitle3, required this.approveDate, required this.modifyDate, required this.thumbnailUrl, required this.originalImgUrl, required this.aiSummary, required this.plainTextContent, required this.ministerCode});
  factory _NewsItemDto.fromJson(Map<String, dynamic> json) => _$NewsItemDtoFromJson(json);

@override final  int id;
@override final  String newsItemId;
@override final  String title;
@override final  String subTitle1;
@override final  String subTitle2;
@override final  String subTitle3;
@override final  DateTime approveDate;
@override final  DateTime modifyDate;
@override final  String thumbnailUrl;
@override final  String originalImgUrl;
@override final  String aiSummary;
@override final  String plainTextContent;
@override final  String ministerCode;

/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsItemDtoCopyWith<_NewsItemDto> get copyWith => __$NewsItemDtoCopyWithImpl<_NewsItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.newsItemId, newsItemId) || other.newsItemId == newsItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.subTitle1, subTitle1) || other.subTitle1 == subTitle1)&&(identical(other.subTitle2, subTitle2) || other.subTitle2 == subTitle2)&&(identical(other.subTitle3, subTitle3) || other.subTitle3 == subTitle3)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.modifyDate, modifyDate) || other.modifyDate == modifyDate)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.originalImgUrl, originalImgUrl) || other.originalImgUrl == originalImgUrl)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.plainTextContent, plainTextContent) || other.plainTextContent == plainTextContent)&&(identical(other.ministerCode, ministerCode) || other.ministerCode == ministerCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,newsItemId,title,subTitle1,subTitle2,subTitle3,approveDate,modifyDate,thumbnailUrl,originalImgUrl,aiSummary,plainTextContent,ministerCode);

@override
String toString() {
  return 'NewsItemDto(id: $id, newsItemId: $newsItemId, title: $title, subTitle1: $subTitle1, subTitle2: $subTitle2, subTitle3: $subTitle3, approveDate: $approveDate, modifyDate: $modifyDate, thumbnailUrl: $thumbnailUrl, originalImgUrl: $originalImgUrl, aiSummary: $aiSummary, plainTextContent: $plainTextContent, ministerCode: $ministerCode)';
}


}

/// @nodoc
abstract mixin class _$NewsItemDtoCopyWith<$Res> implements $NewsItemDtoCopyWith<$Res> {
  factory _$NewsItemDtoCopyWith(_NewsItemDto value, $Res Function(_NewsItemDto) _then) = __$NewsItemDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String newsItemId, String title, String subTitle1, String subTitle2, String subTitle3, DateTime approveDate, DateTime modifyDate, String thumbnailUrl, String originalImgUrl, String aiSummary, String plainTextContent, String ministerCode
});




}
/// @nodoc
class __$NewsItemDtoCopyWithImpl<$Res>
    implements _$NewsItemDtoCopyWith<$Res> {
  __$NewsItemDtoCopyWithImpl(this._self, this._then);

  final _NewsItemDto _self;
  final $Res Function(_NewsItemDto) _then;

/// Create a copy of NewsItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? newsItemId = null,Object? title = null,Object? subTitle1 = null,Object? subTitle2 = null,Object? subTitle3 = null,Object? approveDate = null,Object? modifyDate = null,Object? thumbnailUrl = null,Object? originalImgUrl = null,Object? aiSummary = null,Object? plainTextContent = null,Object? ministerCode = null,}) {
  return _then(_NewsItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,newsItemId: null == newsItemId ? _self.newsItemId : newsItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,subTitle1: null == subTitle1 ? _self.subTitle1 : subTitle1 // ignore: cast_nullable_to_non_nullable
as String,subTitle2: null == subTitle2 ? _self.subTitle2 : subTitle2 // ignore: cast_nullable_to_non_nullable
as String,subTitle3: null == subTitle3 ? _self.subTitle3 : subTitle3 // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as DateTime,modifyDate: null == modifyDate ? _self.modifyDate : modifyDate // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,originalImgUrl: null == originalImgUrl ? _self.originalImgUrl : originalImgUrl // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,plainTextContent: null == plainTextContent ? _self.plainTextContent : plainTextContent // ignore: cast_nullable_to_non_nullable
as String,ministerCode: null == ministerCode ? _self.ministerCode : ministerCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SortDto {

 bool get empty; bool get sorted; bool get unsorted;
/// Create a copy of SortDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortDtoCopyWith<SortDto> get copyWith => _$SortDtoCopyWithImpl<SortDto>(this as SortDto, _$identity);

  /// Serializes this SortDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortDto&&(identical(other.empty, empty) || other.empty == empty)&&(identical(other.sorted, sorted) || other.sorted == sorted)&&(identical(other.unsorted, unsorted) || other.unsorted == unsorted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,empty,sorted,unsorted);

@override
String toString() {
  return 'SortDto(empty: $empty, sorted: $sorted, unsorted: $unsorted)';
}


}

/// @nodoc
abstract mixin class $SortDtoCopyWith<$Res>  {
  factory $SortDtoCopyWith(SortDto value, $Res Function(SortDto) _then) = _$SortDtoCopyWithImpl;
@useResult
$Res call({
 bool empty, bool sorted, bool unsorted
});




}
/// @nodoc
class _$SortDtoCopyWithImpl<$Res>
    implements $SortDtoCopyWith<$Res> {
  _$SortDtoCopyWithImpl(this._self, this._then);

  final SortDto _self;
  final $Res Function(SortDto) _then;

/// Create a copy of SortDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? empty = null,Object? sorted = null,Object? unsorted = null,}) {
  return _then(_self.copyWith(
empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,sorted: null == sorted ? _self.sorted : sorted // ignore: cast_nullable_to_non_nullable
as bool,unsorted: null == unsorted ? _self.unsorted : unsorted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SortDto].
extension SortDtoPatterns on SortDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SortDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SortDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SortDto value)  $default,){
final _that = this;
switch (_that) {
case _SortDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SortDto value)?  $default,){
final _that = this;
switch (_that) {
case _SortDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool empty,  bool sorted,  bool unsorted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SortDto() when $default != null:
return $default(_that.empty,_that.sorted,_that.unsorted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool empty,  bool sorted,  bool unsorted)  $default,) {final _that = this;
switch (_that) {
case _SortDto():
return $default(_that.empty,_that.sorted,_that.unsorted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool empty,  bool sorted,  bool unsorted)?  $default,) {final _that = this;
switch (_that) {
case _SortDto() when $default != null:
return $default(_that.empty,_that.sorted,_that.unsorted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SortDto implements SortDto {
  const _SortDto({required this.empty, required this.sorted, required this.unsorted});
  factory _SortDto.fromJson(Map<String, dynamic> json) => _$SortDtoFromJson(json);

@override final  bool empty;
@override final  bool sorted;
@override final  bool unsorted;

/// Create a copy of SortDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortDtoCopyWith<_SortDto> get copyWith => __$SortDtoCopyWithImpl<_SortDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SortDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortDto&&(identical(other.empty, empty) || other.empty == empty)&&(identical(other.sorted, sorted) || other.sorted == sorted)&&(identical(other.unsorted, unsorted) || other.unsorted == unsorted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,empty,sorted,unsorted);

@override
String toString() {
  return 'SortDto(empty: $empty, sorted: $sorted, unsorted: $unsorted)';
}


}

/// @nodoc
abstract mixin class _$SortDtoCopyWith<$Res> implements $SortDtoCopyWith<$Res> {
  factory _$SortDtoCopyWith(_SortDto value, $Res Function(_SortDto) _then) = __$SortDtoCopyWithImpl;
@override @useResult
$Res call({
 bool empty, bool sorted, bool unsorted
});




}
/// @nodoc
class __$SortDtoCopyWithImpl<$Res>
    implements _$SortDtoCopyWith<$Res> {
  __$SortDtoCopyWithImpl(this._self, this._then);

  final _SortDto _self;
  final $Res Function(_SortDto) _then;

/// Create a copy of SortDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? empty = null,Object? sorted = null,Object? unsorted = null,}) {
  return _then(_SortDto(
empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,sorted: null == sorted ? _self.sorted : sorted // ignore: cast_nullable_to_non_nullable
as bool,unsorted: null == unsorted ? _self.unsorted : unsorted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PageableDto {

 int get pageNumber; int get pageSize; SortDto get sort; int get offset; bool get paged; bool get unpaged;
/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<PageableDto> get copyWith => _$PageableDtoCopyWithImpl<PageableDto>(this as PageableDto, _$identity);

  /// Serializes this PageableDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageableDto&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.paged, paged) || other.paged == paged)&&(identical(other.unpaged, unpaged) || other.unpaged == unpaged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,sort,offset,paged,unpaged);

@override
String toString() {
  return 'PageableDto(pageNumber: $pageNumber, pageSize: $pageSize, sort: $sort, offset: $offset, paged: $paged, unpaged: $unpaged)';
}


}

/// @nodoc
abstract mixin class $PageableDtoCopyWith<$Res>  {
  factory $PageableDtoCopyWith(PageableDto value, $Res Function(PageableDto) _then) = _$PageableDtoCopyWithImpl;
@useResult
$Res call({
 int pageNumber, int pageSize, SortDto sort, int offset, bool paged, bool unpaged
});


$SortDtoCopyWith<$Res> get sort;

}
/// @nodoc
class _$PageableDtoCopyWithImpl<$Res>
    implements $PageableDtoCopyWith<$Res> {
  _$PageableDtoCopyWithImpl(this._self, this._then);

  final PageableDto _self;
  final $Res Function(PageableDto) _then;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageNumber = null,Object? pageSize = null,Object? sort = null,Object? offset = null,Object? paged = null,Object? unpaged = null,}) {
  return _then(_self.copyWith(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SortDto,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,paged: null == paged ? _self.paged : paged // ignore: cast_nullable_to_non_nullable
as bool,unpaged: null == unpaged ? _self.unpaged : unpaged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortDtoCopyWith<$Res> get sort {
  
  return $SortDtoCopyWith<$Res>(_self.sort, (value) {
    return _then(_self.copyWith(sort: value));
  });
}
}


/// Adds pattern-matching-related methods to [PageableDto].
extension PageableDtoPatterns on PageableDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageableDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageableDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageableDto value)  $default,){
final _that = this;
switch (_that) {
case _PageableDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageableDto value)?  $default,){
final _that = this;
switch (_that) {
case _PageableDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize,  SortDto sort,  int offset,  bool paged,  bool unpaged)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageableDto() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.sort,_that.offset,_that.paged,_that.unpaged);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int pageNumber,  int pageSize,  SortDto sort,  int offset,  bool paged,  bool unpaged)  $default,) {final _that = this;
switch (_that) {
case _PageableDto():
return $default(_that.pageNumber,_that.pageSize,_that.sort,_that.offset,_that.paged,_that.unpaged);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int pageNumber,  int pageSize,  SortDto sort,  int offset,  bool paged,  bool unpaged)?  $default,) {final _that = this;
switch (_that) {
case _PageableDto() when $default != null:
return $default(_that.pageNumber,_that.pageSize,_that.sort,_that.offset,_that.paged,_that.unpaged);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PageableDto implements PageableDto {
  const _PageableDto({required this.pageNumber, required this.pageSize, required this.sort, required this.offset, required this.paged, required this.unpaged});
  factory _PageableDto.fromJson(Map<String, dynamic> json) => _$PageableDtoFromJson(json);

@override final  int pageNumber;
@override final  int pageSize;
@override final  SortDto sort;
@override final  int offset;
@override final  bool paged;
@override final  bool unpaged;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageableDtoCopyWith<_PageableDto> get copyWith => __$PageableDtoCopyWithImpl<_PageableDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageableDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageableDto&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.offset, offset) || other.offset == offset)&&(identical(other.paged, paged) || other.paged == paged)&&(identical(other.unpaged, unpaged) || other.unpaged == unpaged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pageNumber,pageSize,sort,offset,paged,unpaged);

@override
String toString() {
  return 'PageableDto(pageNumber: $pageNumber, pageSize: $pageSize, sort: $sort, offset: $offset, paged: $paged, unpaged: $unpaged)';
}


}

/// @nodoc
abstract mixin class _$PageableDtoCopyWith<$Res> implements $PageableDtoCopyWith<$Res> {
  factory _$PageableDtoCopyWith(_PageableDto value, $Res Function(_PageableDto) _then) = __$PageableDtoCopyWithImpl;
@override @useResult
$Res call({
 int pageNumber, int pageSize, SortDto sort, int offset, bool paged, bool unpaged
});


@override $SortDtoCopyWith<$Res> get sort;

}
/// @nodoc
class __$PageableDtoCopyWithImpl<$Res>
    implements _$PageableDtoCopyWith<$Res> {
  __$PageableDtoCopyWithImpl(this._self, this._then);

  final _PageableDto _self;
  final $Res Function(_PageableDto) _then;

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageNumber = null,Object? pageSize = null,Object? sort = null,Object? offset = null,Object? paged = null,Object? unpaged = null,}) {
  return _then(_PageableDto(
pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SortDto,offset: null == offset ? _self.offset : offset // ignore: cast_nullable_to_non_nullable
as int,paged: null == paged ? _self.paged : paged // ignore: cast_nullable_to_non_nullable
as bool,unpaged: null == unpaged ? _self.unpaged : unpaged // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PageableDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortDtoCopyWith<$Res> get sort {
  
  return $SortDtoCopyWith<$Res>(_self.sort, (value) {
    return _then(_self.copyWith(sort: value));
  });
}
}


/// @nodoc
mixin _$NewsPageResponse {

 List<NewsItemDto> get content; PageableDto get pageable; bool get last; int get totalPages; int get totalElements; bool get first; int get size; int get number; SortDto get sort; int get numberOfElements; bool get empty;
/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsPageResponseCopyWith<NewsPageResponse> get copyWith => _$NewsPageResponseCopyWithImpl<NewsPageResponse>(this as NewsPageResponse, _$identity);

  /// Serializes this NewsPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsPageResponse&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.pageable, pageable) || other.pageable == pageable)&&(identical(other.last, last) || other.last == last)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.first, first) || other.first == first)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.numberOfElements, numberOfElements) || other.numberOfElements == numberOfElements)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(content),pageable,last,totalPages,totalElements,first,size,number,sort,numberOfElements,empty);

@override
String toString() {
  return 'NewsPageResponse(content: $content, pageable: $pageable, last: $last, totalPages: $totalPages, totalElements: $totalElements, first: $first, size: $size, number: $number, sort: $sort, numberOfElements: $numberOfElements, empty: $empty)';
}


}

/// @nodoc
abstract mixin class $NewsPageResponseCopyWith<$Res>  {
  factory $NewsPageResponseCopyWith(NewsPageResponse value, $Res Function(NewsPageResponse) _then) = _$NewsPageResponseCopyWithImpl;
@useResult
$Res call({
 List<NewsItemDto> content, PageableDto pageable, bool last, int totalPages, int totalElements, bool first, int size, int number, SortDto sort, int numberOfElements, bool empty
});


$PageableDtoCopyWith<$Res> get pageable;$SortDtoCopyWith<$Res> get sort;

}
/// @nodoc
class _$NewsPageResponseCopyWithImpl<$Res>
    implements $NewsPageResponseCopyWith<$Res> {
  _$NewsPageResponseCopyWithImpl(this._self, this._then);

  final NewsPageResponse _self;
  final $Res Function(NewsPageResponse) _then;

/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? pageable = null,Object? last = null,Object? totalPages = null,Object? totalElements = null,Object? first = null,Object? size = null,Object? number = null,Object? sort = null,Object? numberOfElements = null,Object? empty = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<NewsItemDto>,pageable: null == pageable ? _self.pageable : pageable // ignore: cast_nullable_to_non_nullable
as PageableDto,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SortDto,numberOfElements: null == numberOfElements ? _self.numberOfElements : numberOfElements // ignore: cast_nullable_to_non_nullable
as int,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get pageable {
  
  return $PageableDtoCopyWith<$Res>(_self.pageable, (value) {
    return _then(_self.copyWith(pageable: value));
  });
}/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortDtoCopyWith<$Res> get sort {
  
  return $SortDtoCopyWith<$Res>(_self.sort, (value) {
    return _then(_self.copyWith(sort: value));
  });
}
}


/// Adds pattern-matching-related methods to [NewsPageResponse].
extension NewsPageResponsePatterns on NewsPageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsPageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsPageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsPageResponse value)  $default,){
final _that = this;
switch (_that) {
case _NewsPageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsPageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NewsPageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NewsItemDto> content,  PageableDto pageable,  bool last,  int totalPages,  int totalElements,  bool first,  int size,  int number,  SortDto sort,  int numberOfElements,  bool empty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsPageResponse() when $default != null:
return $default(_that.content,_that.pageable,_that.last,_that.totalPages,_that.totalElements,_that.first,_that.size,_that.number,_that.sort,_that.numberOfElements,_that.empty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NewsItemDto> content,  PageableDto pageable,  bool last,  int totalPages,  int totalElements,  bool first,  int size,  int number,  SortDto sort,  int numberOfElements,  bool empty)  $default,) {final _that = this;
switch (_that) {
case _NewsPageResponse():
return $default(_that.content,_that.pageable,_that.last,_that.totalPages,_that.totalElements,_that.first,_that.size,_that.number,_that.sort,_that.numberOfElements,_that.empty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NewsItemDto> content,  PageableDto pageable,  bool last,  int totalPages,  int totalElements,  bool first,  int size,  int number,  SortDto sort,  int numberOfElements,  bool empty)?  $default,) {final _that = this;
switch (_that) {
case _NewsPageResponse() when $default != null:
return $default(_that.content,_that.pageable,_that.last,_that.totalPages,_that.totalElements,_that.first,_that.size,_that.number,_that.sort,_that.numberOfElements,_that.empty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsPageResponse implements NewsPageResponse {
  const _NewsPageResponse({required final  List<NewsItemDto> content, required this.pageable, required this.last, required this.totalPages, required this.totalElements, required this.first, required this.size, required this.number, required this.sort, required this.numberOfElements, required this.empty}): _content = content;
  factory _NewsPageResponse.fromJson(Map<String, dynamic> json) => _$NewsPageResponseFromJson(json);

 final  List<NewsItemDto> _content;
@override List<NewsItemDto> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  PageableDto pageable;
@override final  bool last;
@override final  int totalPages;
@override final  int totalElements;
@override final  bool first;
@override final  int size;
@override final  int number;
@override final  SortDto sort;
@override final  int numberOfElements;
@override final  bool empty;

/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsPageResponseCopyWith<_NewsPageResponse> get copyWith => __$NewsPageResponseCopyWithImpl<_NewsPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsPageResponse&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.pageable, pageable) || other.pageable == pageable)&&(identical(other.last, last) || other.last == last)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.first, first) || other.first == first)&&(identical(other.size, size) || other.size == size)&&(identical(other.number, number) || other.number == number)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.numberOfElements, numberOfElements) || other.numberOfElements == numberOfElements)&&(identical(other.empty, empty) || other.empty == empty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_content),pageable,last,totalPages,totalElements,first,size,number,sort,numberOfElements,empty);

@override
String toString() {
  return 'NewsPageResponse(content: $content, pageable: $pageable, last: $last, totalPages: $totalPages, totalElements: $totalElements, first: $first, size: $size, number: $number, sort: $sort, numberOfElements: $numberOfElements, empty: $empty)';
}


}

/// @nodoc
abstract mixin class _$NewsPageResponseCopyWith<$Res> implements $NewsPageResponseCopyWith<$Res> {
  factory _$NewsPageResponseCopyWith(_NewsPageResponse value, $Res Function(_NewsPageResponse) _then) = __$NewsPageResponseCopyWithImpl;
@override @useResult
$Res call({
 List<NewsItemDto> content, PageableDto pageable, bool last, int totalPages, int totalElements, bool first, int size, int number, SortDto sort, int numberOfElements, bool empty
});


@override $PageableDtoCopyWith<$Res> get pageable;@override $SortDtoCopyWith<$Res> get sort;

}
/// @nodoc
class __$NewsPageResponseCopyWithImpl<$Res>
    implements _$NewsPageResponseCopyWith<$Res> {
  __$NewsPageResponseCopyWithImpl(this._self, this._then);

  final _NewsPageResponse _self;
  final $Res Function(_NewsPageResponse) _then;

/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? pageable = null,Object? last = null,Object? totalPages = null,Object? totalElements = null,Object? first = null,Object? size = null,Object? number = null,Object? sort = null,Object? numberOfElements = null,Object? empty = null,}) {
  return _then(_NewsPageResponse(
content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<NewsItemDto>,pageable: null == pageable ? _self.pageable : pageable // ignore: cast_nullable_to_non_nullable
as PageableDto,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SortDto,numberOfElements: null == numberOfElements ? _self.numberOfElements : numberOfElements // ignore: cast_nullable_to_non_nullable
as int,empty: null == empty ? _self.empty : empty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageableDtoCopyWith<$Res> get pageable {
  
  return $PageableDtoCopyWith<$Res>(_self.pageable, (value) {
    return _then(_self.copyWith(pageable: value));
  });
}/// Create a copy of NewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SortDtoCopyWith<$Res> get sort {
  
  return $SortDtoCopyWith<$Res>(_self.sort, (value) {
    return _then(_self.copyWith(sort: value));
  });
}
}

// dart format on
