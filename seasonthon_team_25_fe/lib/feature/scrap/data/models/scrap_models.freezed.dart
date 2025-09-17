// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scrap_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScrapResponse {

 int get newsArticleId; String get message; String? get achievementType; bool get achievementCreated; bool get scraped;
/// Create a copy of ScrapResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapResponseCopyWith<ScrapResponse> get copyWith => _$ScrapResponseCopyWithImpl<ScrapResponse>(this as ScrapResponse, _$identity);

  /// Serializes this ScrapResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapResponse&&(identical(other.newsArticleId, newsArticleId) || other.newsArticleId == newsArticleId)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsArticleId,message,achievementType,achievementCreated,scraped);

@override
String toString() {
  return 'ScrapResponse(newsArticleId: $newsArticleId, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class $ScrapResponseCopyWith<$Res>  {
  factory $ScrapResponseCopyWith(ScrapResponse value, $Res Function(ScrapResponse) _then) = _$ScrapResponseCopyWithImpl;
@useResult
$Res call({
 int newsArticleId, String message, String? achievementType, bool achievementCreated, bool scraped
});




}
/// @nodoc
class _$ScrapResponseCopyWithImpl<$Res>
    implements $ScrapResponseCopyWith<$Res> {
  _$ScrapResponseCopyWithImpl(this._self, this._then);

  final ScrapResponse _self;
  final $Res Function(ScrapResponse) _then;

/// Create a copy of ScrapResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newsArticleId = null,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,Object? scraped = null,}) {
  return _then(_self.copyWith(
newsArticleId: null == newsArticleId ? _self.newsArticleId : newsArticleId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapResponse].
extension ScrapResponsePatterns on ScrapResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapResponse value)  $default,){
final _that = this;
switch (_that) {
case _ScrapResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int newsArticleId,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapResponse() when $default != null:
return $default(_that.newsArticleId,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int newsArticleId,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)  $default,) {final _that = this;
switch (_that) {
case _ScrapResponse():
return $default(_that.newsArticleId,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int newsArticleId,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)?  $default,) {final _that = this;
switch (_that) {
case _ScrapResponse() when $default != null:
return $default(_that.newsArticleId,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapResponse implements ScrapResponse {
  const _ScrapResponse({required this.newsArticleId, required this.message, this.achievementType, required this.achievementCreated, required this.scraped});
  factory _ScrapResponse.fromJson(Map<String, dynamic> json) => _$ScrapResponseFromJson(json);

@override final  int newsArticleId;
@override final  String message;
@override final  String? achievementType;
@override final  bool achievementCreated;
@override final  bool scraped;

/// Create a copy of ScrapResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapResponseCopyWith<_ScrapResponse> get copyWith => __$ScrapResponseCopyWithImpl<_ScrapResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapResponse&&(identical(other.newsArticleId, newsArticleId) || other.newsArticleId == newsArticleId)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsArticleId,message,achievementType,achievementCreated,scraped);

@override
String toString() {
  return 'ScrapResponse(newsArticleId: $newsArticleId, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class _$ScrapResponseCopyWith<$Res> implements $ScrapResponseCopyWith<$Res> {
  factory _$ScrapResponseCopyWith(_ScrapResponse value, $Res Function(_ScrapResponse) _then) = __$ScrapResponseCopyWithImpl;
@override @useResult
$Res call({
 int newsArticleId, String message, String? achievementType, bool achievementCreated, bool scraped
});




}
/// @nodoc
class __$ScrapResponseCopyWithImpl<$Res>
    implements _$ScrapResponseCopyWith<$Res> {
  __$ScrapResponseCopyWithImpl(this._self, this._then);

  final _ScrapResponse _self;
  final $Res Function(_ScrapResponse) _then;

/// Create a copy of ScrapResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newsArticleId = null,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,Object? scraped = null,}) {
  return _then(_ScrapResponse(
newsArticleId: null == newsArticleId ? _self.newsArticleId : newsArticleId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ScrapNewsItem {

 int get newsArticleId; String get scrappedDate; String get title; String get aiSummary; String get thumbnailUrl; String get approveDate; bool get scraped;
/// Create a copy of ScrapNewsItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapNewsItemCopyWith<ScrapNewsItem> get copyWith => _$ScrapNewsItemCopyWithImpl<ScrapNewsItem>(this as ScrapNewsItem, _$identity);

  /// Serializes this ScrapNewsItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapNewsItem&&(identical(other.newsArticleId, newsArticleId) || other.newsArticleId == newsArticleId)&&(identical(other.scrappedDate, scrappedDate) || other.scrappedDate == scrappedDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsArticleId,scrappedDate,title,aiSummary,thumbnailUrl,approveDate,scraped);

@override
String toString() {
  return 'ScrapNewsItem(newsArticleId: $newsArticleId, scrappedDate: $scrappedDate, title: $title, aiSummary: $aiSummary, thumbnailUrl: $thumbnailUrl, approveDate: $approveDate, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class $ScrapNewsItemCopyWith<$Res>  {
  factory $ScrapNewsItemCopyWith(ScrapNewsItem value, $Res Function(ScrapNewsItem) _then) = _$ScrapNewsItemCopyWithImpl;
@useResult
$Res call({
 int newsArticleId, String scrappedDate, String title, String aiSummary, String thumbnailUrl, String approveDate, bool scraped
});




}
/// @nodoc
class _$ScrapNewsItemCopyWithImpl<$Res>
    implements $ScrapNewsItemCopyWith<$Res> {
  _$ScrapNewsItemCopyWithImpl(this._self, this._then);

  final ScrapNewsItem _self;
  final $Res Function(ScrapNewsItem) _then;

/// Create a copy of ScrapNewsItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? newsArticleId = null,Object? scrappedDate = null,Object? title = null,Object? aiSummary = null,Object? thumbnailUrl = null,Object? approveDate = null,Object? scraped = null,}) {
  return _then(_self.copyWith(
newsArticleId: null == newsArticleId ? _self.newsArticleId : newsArticleId // ignore: cast_nullable_to_non_nullable
as int,scrappedDate: null == scrappedDate ? _self.scrappedDate : scrappedDate // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as String,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapNewsItem].
extension ScrapNewsItemPatterns on ScrapNewsItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapNewsItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapNewsItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapNewsItem value)  $default,){
final _that = this;
switch (_that) {
case _ScrapNewsItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapNewsItem value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapNewsItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int newsArticleId,  String scrappedDate,  String title,  String aiSummary,  String thumbnailUrl,  String approveDate,  bool scraped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapNewsItem() when $default != null:
return $default(_that.newsArticleId,_that.scrappedDate,_that.title,_that.aiSummary,_that.thumbnailUrl,_that.approveDate,_that.scraped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int newsArticleId,  String scrappedDate,  String title,  String aiSummary,  String thumbnailUrl,  String approveDate,  bool scraped)  $default,) {final _that = this;
switch (_that) {
case _ScrapNewsItem():
return $default(_that.newsArticleId,_that.scrappedDate,_that.title,_that.aiSummary,_that.thumbnailUrl,_that.approveDate,_that.scraped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int newsArticleId,  String scrappedDate,  String title,  String aiSummary,  String thumbnailUrl,  String approveDate,  bool scraped)?  $default,) {final _that = this;
switch (_that) {
case _ScrapNewsItem() when $default != null:
return $default(_that.newsArticleId,_that.scrappedDate,_that.title,_that.aiSummary,_that.thumbnailUrl,_that.approveDate,_that.scraped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapNewsItem implements ScrapNewsItem {
  const _ScrapNewsItem({required this.newsArticleId, required this.scrappedDate, required this.title, required this.aiSummary, required this.thumbnailUrl, required this.approveDate, required this.scraped});
  factory _ScrapNewsItem.fromJson(Map<String, dynamic> json) => _$ScrapNewsItemFromJson(json);

@override final  int newsArticleId;
@override final  String scrappedDate;
@override final  String title;
@override final  String aiSummary;
@override final  String thumbnailUrl;
@override final  String approveDate;
@override final  bool scraped;

/// Create a copy of ScrapNewsItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapNewsItemCopyWith<_ScrapNewsItem> get copyWith => __$ScrapNewsItemCopyWithImpl<_ScrapNewsItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapNewsItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapNewsItem&&(identical(other.newsArticleId, newsArticleId) || other.newsArticleId == newsArticleId)&&(identical(other.scrappedDate, scrappedDate) || other.scrappedDate == scrappedDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.aiSummary, aiSummary) || other.aiSummary == aiSummary)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.approveDate, approveDate) || other.approveDate == approveDate)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,newsArticleId,scrappedDate,title,aiSummary,thumbnailUrl,approveDate,scraped);

@override
String toString() {
  return 'ScrapNewsItem(newsArticleId: $newsArticleId, scrappedDate: $scrappedDate, title: $title, aiSummary: $aiSummary, thumbnailUrl: $thumbnailUrl, approveDate: $approveDate, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class _$ScrapNewsItemCopyWith<$Res> implements $ScrapNewsItemCopyWith<$Res> {
  factory _$ScrapNewsItemCopyWith(_ScrapNewsItem value, $Res Function(_ScrapNewsItem) _then) = __$ScrapNewsItemCopyWithImpl;
@override @useResult
$Res call({
 int newsArticleId, String scrappedDate, String title, String aiSummary, String thumbnailUrl, String approveDate, bool scraped
});




}
/// @nodoc
class __$ScrapNewsItemCopyWithImpl<$Res>
    implements _$ScrapNewsItemCopyWith<$Res> {
  __$ScrapNewsItemCopyWithImpl(this._self, this._then);

  final _ScrapNewsItem _self;
  final $Res Function(_ScrapNewsItem) _then;

/// Create a copy of ScrapNewsItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? newsArticleId = null,Object? scrappedDate = null,Object? title = null,Object? aiSummary = null,Object? thumbnailUrl = null,Object? approveDate = null,Object? scraped = null,}) {
  return _then(_ScrapNewsItem(
newsArticleId: null == newsArticleId ? _self.newsArticleId : newsArticleId // ignore: cast_nullable_to_non_nullable
as int,scrappedDate: null == scrappedDate ? _self.scrappedDate : scrappedDate // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,aiSummary: null == aiSummary ? _self.aiSummary : aiSummary // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,approveDate: null == approveDate ? _self.approveDate : approveDate // ignore: cast_nullable_to_non_nullable
as String,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ScrapNewsPageResponse {

 int get page; List<ScrapNewsItem> get content; int get size; int get totalElements; int get totalPages; bool get first; bool get last; bool get hasNext; bool get hasPrevious;
/// Create a copy of ScrapNewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapNewsPageResponseCopyWith<ScrapNewsPageResponse> get copyWith => _$ScrapNewsPageResponseCopyWithImpl<ScrapNewsPageResponse>(this as ScrapNewsPageResponse, _$identity);

  /// Serializes this ScrapNewsPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapNewsPageResponse&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(content),size,totalElements,totalPages,first,last,hasNext,hasPrevious);

@override
String toString() {
  return 'ScrapNewsPageResponse(page: $page, content: $content, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, hasNext: $hasNext, hasPrevious: $hasPrevious)';
}


}

/// @nodoc
abstract mixin class $ScrapNewsPageResponseCopyWith<$Res>  {
  factory $ScrapNewsPageResponseCopyWith(ScrapNewsPageResponse value, $Res Function(ScrapNewsPageResponse) _then) = _$ScrapNewsPageResponseCopyWithImpl;
@useResult
$Res call({
 int page, List<ScrapNewsItem> content, int size, int totalElements, int totalPages, bool first, bool last, bool hasNext, bool hasPrevious
});




}
/// @nodoc
class _$ScrapNewsPageResponseCopyWithImpl<$Res>
    implements $ScrapNewsPageResponseCopyWith<$Res> {
  _$ScrapNewsPageResponseCopyWithImpl(this._self, this._then);

  final ScrapNewsPageResponse _self;
  final $Res Function(ScrapNewsPageResponse) _then;

/// Create a copy of ScrapNewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? content = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,Object? hasNext = null,Object? hasPrevious = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ScrapNewsItem>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapNewsPageResponse].
extension ScrapNewsPageResponsePatterns on ScrapNewsPageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapNewsPageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapNewsPageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapNewsPageResponse value)  $default,){
final _that = this;
switch (_that) {
case _ScrapNewsPageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapNewsPageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapNewsPageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  List<ScrapNewsItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapNewsPageResponse() when $default != null:
return $default(_that.page,_that.content,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.hasNext,_that.hasPrevious);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  List<ScrapNewsItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)  $default,) {final _that = this;
switch (_that) {
case _ScrapNewsPageResponse():
return $default(_that.page,_that.content,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.hasNext,_that.hasPrevious);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  List<ScrapNewsItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)?  $default,) {final _that = this;
switch (_that) {
case _ScrapNewsPageResponse() when $default != null:
return $default(_that.page,_that.content,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.hasNext,_that.hasPrevious);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapNewsPageResponse implements ScrapNewsPageResponse {
  const _ScrapNewsPageResponse({required this.page, required final  List<ScrapNewsItem> content, required this.size, required this.totalElements, required this.totalPages, required this.first, required this.last, required this.hasNext, required this.hasPrevious}): _content = content;
  factory _ScrapNewsPageResponse.fromJson(Map<String, dynamic> json) => _$ScrapNewsPageResponseFromJson(json);

@override final  int page;
 final  List<ScrapNewsItem> _content;
@override List<ScrapNewsItem> get content {
  if (_content is EqualUnmodifiableListView) return _content;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_content);
}

@override final  int size;
@override final  int totalElements;
@override final  int totalPages;
@override final  bool first;
@override final  bool last;
@override final  bool hasNext;
@override final  bool hasPrevious;

/// Create a copy of ScrapNewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapNewsPageResponseCopyWith<_ScrapNewsPageResponse> get copyWith => __$ScrapNewsPageResponseCopyWithImpl<_ScrapNewsPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapNewsPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapNewsPageResponse&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_content),size,totalElements,totalPages,first,last,hasNext,hasPrevious);

@override
String toString() {
  return 'ScrapNewsPageResponse(page: $page, content: $content, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, hasNext: $hasNext, hasPrevious: $hasPrevious)';
}


}

/// @nodoc
abstract mixin class _$ScrapNewsPageResponseCopyWith<$Res> implements $ScrapNewsPageResponseCopyWith<$Res> {
  factory _$ScrapNewsPageResponseCopyWith(_ScrapNewsPageResponse value, $Res Function(_ScrapNewsPageResponse) _then) = __$ScrapNewsPageResponseCopyWithImpl;
@override @useResult
$Res call({
 int page, List<ScrapNewsItem> content, int size, int totalElements, int totalPages, bool first, bool last, bool hasNext, bool hasPrevious
});




}
/// @nodoc
class __$ScrapNewsPageResponseCopyWithImpl<$Res>
    implements _$ScrapNewsPageResponseCopyWith<$Res> {
  __$ScrapNewsPageResponseCopyWithImpl(this._self, this._then);

  final _ScrapNewsPageResponse _self;
  final $Res Function(_ScrapNewsPageResponse) _then;

/// Create a copy of ScrapNewsPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? content = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,Object? hasNext = null,Object? hasPrevious = null,}) {
  return _then(_ScrapNewsPageResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ScrapNewsItem>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,totalElements: null == totalElements ? _self.totalElements : totalElements // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as bool,last: null == last ? _self.last : last // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,hasPrevious: null == hasPrevious ? _self.hasPrevious : hasPrevious // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
