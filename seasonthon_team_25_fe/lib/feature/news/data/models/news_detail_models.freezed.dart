// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_detail_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewsDetailResponse {

 int get id; String get newsItemId; String get title; DateTime get approveDate; DateTime get modifyDate; String get thumbnailUrl; String get originalImgUrl; String get aiSummary; String get plainTextContent; String get ministerCode; List<ContentBlockResponse> get contentBlocks; bool get scraped;
/// Create a copy of NewsDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NewsDetailResponseCopyWith<NewsDetailResponse> get copyWith => _$NewsDetailResponseCopyWithImpl<NewsDetailResponse>(this as NewsDetailResponse, _$identity);

  /// Serializes this NewsDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NewsDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.newsItemId, newsItemId) || other.newsItemId == newsItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.modifyDate, modifyDate) || other.modifyDate == modifyDate)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.originalImgUrl, originalImgUrl) || other.originalImgUrl == originalImgUrl)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.plainTextContent, plainTextContent) || other.plainTextContent == plainTextContent)&&(identical(other.ministerCode, ministerCode) || other.ministerCode == ministerCode)&&const DeepCollectionEquality().equals(other.contentBlocks, contentBlocks)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,newsItemId,title,approveDate,modifyDate,thumbnailUrl,originalImgUrl,aiSummary,plainTextContent,ministerCode,const DeepCollectionEquality().hash(contentBlocks),scraped);

@override
String toString() {
  return 'NewsDetailResponse(id: $id, newsItemId: $newsItemId, title: $title, approveDate: $approveDate, modifyDate: $modifyDate, thumbnailUrl: $thumbnailUrl, originalImgUrl: $originalImgUrl, aiSummary: $aiSummary, plainTextContent: $plainTextContent, ministerCode: $ministerCode, contentBlocks: $contentBlocks, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class $NewsDetailResponseCopyWith<$Res>  {
  factory $NewsDetailResponseCopyWith(NewsDetailResponse value, $Res Function(NewsDetailResponse) _then) = _$NewsDetailResponseCopyWithImpl;
@useResult
$Res call({
 int id, String newsItemId, String title, DateTime approveDate, DateTime modifyDate, String thumbnailUrl, String originalImgUrl, String aiSummary, String plainTextContent, String ministerCode, List<ContentBlockResponse> contentBlocks, bool scraped
});




}
/// @nodoc
class _$NewsDetailResponseCopyWithImpl<$Res>
    implements $NewsDetailResponseCopyWith<$Res> {
  _$NewsDetailResponseCopyWithImpl(this._self, this._then);

  final NewsDetailResponse _self;
  final $Res Function(NewsDetailResponse) _then;

/// Create a copy of NewsDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? newsItemId = null,Object? title = null,Object? approveDate = null,Object? modifyDate = null,Object? thumbnailUrl = null,Object? originalImgUrl = null,Object? aiSummary = null,Object? plainTextContent = null,Object? ministerCode = null,Object? contentBlocks = null,Object? scraped = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,newsItemId: null == newsItemId ? _self.newsItemId : newsItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as DateTime,modifyDate: null == modifyDate ? _self.modifyDate : modifyDate // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,originalImgUrl: null == originalImgUrl ? _self.originalImgUrl : originalImgUrl // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,plainTextContent: null == plainTextContent ? _self.plainTextContent : plainTextContent // ignore: cast_nullable_to_non_nullable
as String,ministerCode: null == ministerCode ? _self.ministerCode : ministerCode // ignore: cast_nullable_to_non_nullable
as String,contentBlocks: null == contentBlocks ? _self.contentBlocks : contentBlocks // ignore: cast_nullable_to_non_nullable
as List<ContentBlockResponse>,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NewsDetailResponse].
extension NewsDetailResponsePatterns on NewsDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NewsDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NewsDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NewsDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _NewsDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NewsDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NewsDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String newsItemId,  String title,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode,  List<ContentBlockResponse> contentBlocks,  bool scraped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NewsDetailResponse() when $default != null:
return $default(_that.id,_that.newsItemId,_that.title,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode,_that.contentBlocks,_that.scraped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String newsItemId,  String title,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode,  List<ContentBlockResponse> contentBlocks,  bool scraped)  $default,) {final _that = this;
switch (_that) {
case _NewsDetailResponse():
return $default(_that.id,_that.newsItemId,_that.title,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode,_that.contentBlocks,_that.scraped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String newsItemId,  String title,  DateTime approveDate,  DateTime modifyDate,  String thumbnailUrl,  String originalImgUrl,  String aiSummary,  String plainTextContent,  String ministerCode,  List<ContentBlockResponse> contentBlocks,  bool scraped)?  $default,) {final _that = this;
switch (_that) {
case _NewsDetailResponse() when $default != null:
return $default(_that.id,_that.newsItemId,_that.title,_that.approveDate,_that.modifyDate,_that.thumbnailUrl,_that.originalImgUrl,_that.aiSummary,_that.plainTextContent,_that.ministerCode,_that.contentBlocks,_that.scraped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NewsDetailResponse implements NewsDetailResponse {
  const _NewsDetailResponse({required this.id, required this.newsItemId, required this.title, required this.approveDate, required this.modifyDate, required this.thumbnailUrl, required this.originalImgUrl, required this.aiSummary, required this.plainTextContent, required this.ministerCode, required final  List<ContentBlockResponse> contentBlocks, required this.scraped}): _contentBlocks = contentBlocks;
  factory _NewsDetailResponse.fromJson(Map<String, dynamic> json) => _$NewsDetailResponseFromJson(json);

@override final  int id;
@override final  String newsItemId;
@override final  String title;
@override final  DateTime approveDate;
@override final  DateTime modifyDate;
@override final  String thumbnailUrl;
@override final  String originalImgUrl;
@override final  String aiSummary;
@override final  String plainTextContent;
@override final  String ministerCode;
 final  List<ContentBlockResponse> _contentBlocks;
@override List<ContentBlockResponse> get contentBlocks {
  if (_contentBlocks is EqualUnmodifiableListView) return _contentBlocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contentBlocks);
}

@override final  bool scraped;

/// Create a copy of NewsDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NewsDetailResponseCopyWith<_NewsDetailResponse> get copyWith => __$NewsDetailResponseCopyWithImpl<_NewsDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NewsDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NewsDetailResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.newsItemId, newsItemId) || other.newsItemId == newsItemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.modifyDate, modifyDate) || other.modifyDate == modifyDate)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.originalImgUrl, originalImgUrl) || other.originalImgUrl == originalImgUrl)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.plainTextContent, plainTextContent) || other.plainTextContent == plainTextContent)&&(identical(other.ministerCode, ministerCode) || other.ministerCode == ministerCode)&&const DeepCollectionEquality().equals(other._contentBlocks, _contentBlocks)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,newsItemId,title,approveDate,modifyDate,thumbnailUrl,originalImgUrl,aiSummary,plainTextContent,ministerCode,const DeepCollectionEquality().hash(_contentBlocks),scraped);

@override
String toString() {
  return 'NewsDetailResponse(id: $id, newsItemId: $newsItemId, title: $title, approveDate: $approveDate, modifyDate: $modifyDate, thumbnailUrl: $thumbnailUrl, originalImgUrl: $originalImgUrl, aiSummary: $aiSummary, plainTextContent: $plainTextContent, ministerCode: $ministerCode, contentBlocks: $contentBlocks, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class _$NewsDetailResponseCopyWith<$Res> implements $NewsDetailResponseCopyWith<$Res> {
  factory _$NewsDetailResponseCopyWith(_NewsDetailResponse value, $Res Function(_NewsDetailResponse) _then) = __$NewsDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 int id, String newsItemId, String title, DateTime approveDate, DateTime modifyDate, String thumbnailUrl, String originalImgUrl, String aiSummary, String plainTextContent, String ministerCode, List<ContentBlockResponse> contentBlocks, bool scraped
});




}
/// @nodoc
class __$NewsDetailResponseCopyWithImpl<$Res>
    implements _$NewsDetailResponseCopyWith<$Res> {
  __$NewsDetailResponseCopyWithImpl(this._self, this._then);

  final _NewsDetailResponse _self;
  final $Res Function(_NewsDetailResponse) _then;

/// Create a copy of NewsDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? newsItemId = null,Object? title = null,Object? approveDate = null,Object? modifyDate = null,Object? thumbnailUrl = null,Object? originalImgUrl = null,Object? aiSummary = null,Object? plainTextContent = null,Object? ministerCode = null,Object? contentBlocks = null,Object? scraped = null,}) {
  return _then(_NewsDetailResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,newsItemId: null == newsItemId ? _self.newsItemId : newsItemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as DateTime,modifyDate: null == modifyDate ? _self.modifyDate : modifyDate // ignore: cast_nullable_to_non_nullable
as DateTime,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,originalImgUrl: null == originalImgUrl ? _self.originalImgUrl : originalImgUrl // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,plainTextContent: null == plainTextContent ? _self.plainTextContent : plainTextContent // ignore: cast_nullable_to_non_nullable
as String,ministerCode: null == ministerCode ? _self.ministerCode : ministerCode // ignore: cast_nullable_to_non_nullable
as String,contentBlocks: null == contentBlocks ? _self._contentBlocks : contentBlocks // ignore: cast_nullable_to_non_nullable
as List<ContentBlockResponse>,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ContentBlockResponse {

 String get blockType;// "text" | "image" | "paragraph_break" ...
 String? get originalContent; String? get plainContent; String? get url; String? get altText; int get blockOrder;
/// Create a copy of ContentBlockResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentBlockResponseCopyWith<ContentBlockResponse> get copyWith => _$ContentBlockResponseCopyWithImpl<ContentBlockResponse>(this as ContentBlockResponse, _$identity);

  /// Serializes this ContentBlockResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentBlockResponse&&(identical(other.blockType, blockType) || other.blockType == blockType)&&(identical(other.originalContent, originalContent) || other.originalContent == originalContent)&&(identical(other.plainContent, plainContent) || other.plainContent == plainContent)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.blockOrder, blockOrder) || other.blockOrder == blockOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blockType,originalContent,plainContent,url,altText,blockOrder);

@override
String toString() {
  return 'ContentBlockResponse(blockType: $blockType, originalContent: $originalContent, plainContent: $plainContent, url: $url, altText: $altText, blockOrder: $blockOrder)';
}


}

/// @nodoc
abstract mixin class $ContentBlockResponseCopyWith<$Res>  {
  factory $ContentBlockResponseCopyWith(ContentBlockResponse value, $Res Function(ContentBlockResponse) _then) = _$ContentBlockResponseCopyWithImpl;
@useResult
$Res call({
 String blockType, String? originalContent, String? plainContent, String? url, String? altText, int blockOrder
});




}
/// @nodoc
class _$ContentBlockResponseCopyWithImpl<$Res>
    implements $ContentBlockResponseCopyWith<$Res> {
  _$ContentBlockResponseCopyWithImpl(this._self, this._then);

  final ContentBlockResponse _self;
  final $Res Function(ContentBlockResponse) _then;

/// Create a copy of ContentBlockResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blockType = null,Object? originalContent = freezed,Object? plainContent = freezed,Object? url = freezed,Object? altText = freezed,Object? blockOrder = null,}) {
  return _then(_self.copyWith(
blockType: null == blockType ? _self.blockType : blockType // ignore: cast_nullable_to_non_nullable
as String,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,plainContent: freezed == plainContent ? _self.plainContent : plainContent // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,altText: freezed == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String?,blockOrder: null == blockOrder ? _self.blockOrder : blockOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentBlockResponse].
extension ContentBlockResponsePatterns on ContentBlockResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentBlockResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentBlockResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentBlockResponse value)  $default,){
final _that = this;
switch (_that) {
case _ContentBlockResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentBlockResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ContentBlockResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String blockType,  String? originalContent,  String? plainContent,  String? url,  String? altText,  int blockOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentBlockResponse() when $default != null:
return $default(_that.blockType,_that.originalContent,_that.plainContent,_that.url,_that.altText,_that.blockOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String blockType,  String? originalContent,  String? plainContent,  String? url,  String? altText,  int blockOrder)  $default,) {final _that = this;
switch (_that) {
case _ContentBlockResponse():
return $default(_that.blockType,_that.originalContent,_that.plainContent,_that.url,_that.altText,_that.blockOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String blockType,  String? originalContent,  String? plainContent,  String? url,  String? altText,  int blockOrder)?  $default,) {final _that = this;
switch (_that) {
case _ContentBlockResponse() when $default != null:
return $default(_that.blockType,_that.originalContent,_that.plainContent,_that.url,_that.altText,_that.blockOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentBlockResponse implements ContentBlockResponse {
  const _ContentBlockResponse({required this.blockType, this.originalContent, this.plainContent, this.url, this.altText, required this.blockOrder});
  factory _ContentBlockResponse.fromJson(Map<String, dynamic> json) => _$ContentBlockResponseFromJson(json);

@override final  String blockType;
// "text" | "image" | "paragraph_break" ...
@override final  String? originalContent;
@override final  String? plainContent;
@override final  String? url;
@override final  String? altText;
@override final  int blockOrder;

/// Create a copy of ContentBlockResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentBlockResponseCopyWith<_ContentBlockResponse> get copyWith => __$ContentBlockResponseCopyWithImpl<_ContentBlockResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentBlockResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentBlockResponse&&(identical(other.blockType, blockType) || other.blockType == blockType)&&(identical(other.originalContent, originalContent) || other.originalContent == originalContent)&&(identical(other.plainContent, plainContent) || other.plainContent == plainContent)&&(identical(other.url, url) || other.url == url)&&(identical(other.altText, altText) || other.altText == altText)&&(identical(other.blockOrder, blockOrder) || other.blockOrder == blockOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blockType,originalContent,plainContent,url,altText,blockOrder);

@override
String toString() {
  return 'ContentBlockResponse(blockType: $blockType, originalContent: $originalContent, plainContent: $plainContent, url: $url, altText: $altText, blockOrder: $blockOrder)';
}


}

/// @nodoc
abstract mixin class _$ContentBlockResponseCopyWith<$Res> implements $ContentBlockResponseCopyWith<$Res> {
  factory _$ContentBlockResponseCopyWith(_ContentBlockResponse value, $Res Function(_ContentBlockResponse) _then) = __$ContentBlockResponseCopyWithImpl;
@override @useResult
$Res call({
 String blockType, String? originalContent, String? plainContent, String? url, String? altText, int blockOrder
});




}
/// @nodoc
class __$ContentBlockResponseCopyWithImpl<$Res>
    implements _$ContentBlockResponseCopyWith<$Res> {
  __$ContentBlockResponseCopyWithImpl(this._self, this._then);

  final _ContentBlockResponse _self;
  final $Res Function(_ContentBlockResponse) _then;

/// Create a copy of ContentBlockResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? blockType = null,Object? originalContent = freezed,Object? plainContent = freezed,Object? url = freezed,Object? altText = freezed,Object? blockOrder = null,}) {
  return _then(_ContentBlockResponse(
blockType: null == blockType ? _self.blockType : blockType // ignore: cast_nullable_to_non_nullable
as String,originalContent: freezed == originalContent ? _self.originalContent : originalContent // ignore: cast_nullable_to_non_nullable
as String?,plainContent: freezed == plainContent ? _self.plainContent : plainContent // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,altText: freezed == altText ? _self.altText : altText // ignore: cast_nullable_to_non_nullable
as String?,blockOrder: null == blockOrder ? _self.blockOrder : blockOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
