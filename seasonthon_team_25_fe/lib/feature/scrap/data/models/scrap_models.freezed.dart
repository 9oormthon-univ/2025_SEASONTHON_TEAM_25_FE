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


/// @nodoc
mixin _$QuizScrapRequest {

 int get userQuizId; bool get isCorrect;
/// Create a copy of QuizScrapRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizScrapRequestCopyWith<QuizScrapRequest> get copyWith => _$QuizScrapRequestCopyWithImpl<QuizScrapRequest>(this as QuizScrapRequest, _$identity);

  /// Serializes this QuizScrapRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizScrapRequest&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,isCorrect);

@override
String toString() {
  return 'QuizScrapRequest(userQuizId: $userQuizId, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class $QuizScrapRequestCopyWith<$Res>  {
  factory $QuizScrapRequestCopyWith(QuizScrapRequest value, $Res Function(QuizScrapRequest) _then) = _$QuizScrapRequestCopyWithImpl;
@useResult
$Res call({
 int userQuizId, bool isCorrect
});




}
/// @nodoc
class _$QuizScrapRequestCopyWithImpl<$Res>
    implements $QuizScrapRequestCopyWith<$Res> {
  _$QuizScrapRequestCopyWithImpl(this._self, this._then);

  final QuizScrapRequest _self;
  final $Res Function(QuizScrapRequest) _then;

/// Create a copy of QuizScrapRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuizId = null,Object? isCorrect = null,}) {
  return _then(_self.copyWith(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizScrapRequest].
extension QuizScrapRequestPatterns on QuizScrapRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizScrapRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizScrapRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizScrapRequest value)  $default,){
final _that = this;
switch (_that) {
case _QuizScrapRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizScrapRequest value)?  $default,){
final _that = this;
switch (_that) {
case _QuizScrapRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuizId,  bool isCorrect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizScrapRequest() when $default != null:
return $default(_that.userQuizId,_that.isCorrect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuizId,  bool isCorrect)  $default,) {final _that = this;
switch (_that) {
case _QuizScrapRequest():
return $default(_that.userQuizId,_that.isCorrect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuizId,  bool isCorrect)?  $default,) {final _that = this;
switch (_that) {
case _QuizScrapRequest() when $default != null:
return $default(_that.userQuizId,_that.isCorrect);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizScrapRequest implements QuizScrapRequest {
  const _QuizScrapRequest({required this.userQuizId, required this.isCorrect});
  factory _QuizScrapRequest.fromJson(Map<String, dynamic> json) => _$QuizScrapRequestFromJson(json);

@override final  int userQuizId;
@override final  bool isCorrect;

/// Create a copy of QuizScrapRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizScrapRequestCopyWith<_QuizScrapRequest> get copyWith => __$QuizScrapRequestCopyWithImpl<_QuizScrapRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizScrapRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizScrapRequest&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,isCorrect);

@override
String toString() {
  return 'QuizScrapRequest(userQuizId: $userQuizId, isCorrect: $isCorrect)';
}


}

/// @nodoc
abstract mixin class _$QuizScrapRequestCopyWith<$Res> implements $QuizScrapRequestCopyWith<$Res> {
  factory _$QuizScrapRequestCopyWith(_QuizScrapRequest value, $Res Function(_QuizScrapRequest) _then) = __$QuizScrapRequestCopyWithImpl;
@override @useResult
$Res call({
 int userQuizId, bool isCorrect
});




}
/// @nodoc
class __$QuizScrapRequestCopyWithImpl<$Res>
    implements _$QuizScrapRequestCopyWith<$Res> {
  __$QuizScrapRequestCopyWithImpl(this._self, this._then);

  final _QuizScrapRequest _self;
  final $Res Function(_QuizScrapRequest) _then;

/// Create a copy of QuizScrapRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuizId = null,Object? isCorrect = null,}) {
  return _then(_QuizScrapRequest(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$QuizScrapResponse {

 int get userQuizId; bool? get isCorrectAtScrap; String get message; String? get achievementType; bool get achievementCreated; bool get scraped;
/// Create a copy of QuizScrapResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizScrapResponseCopyWith<QuizScrapResponse> get copyWith => _$QuizScrapResponseCopyWithImpl<QuizScrapResponse>(this as QuizScrapResponse, _$identity);

  /// Serializes this QuizScrapResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizScrapResponse&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.isCorrectAtScrap, isCorrectAtScrap) || other.isCorrectAtScrap == isCorrectAtScrap)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,isCorrectAtScrap,message,achievementType,achievementCreated,scraped);

@override
String toString() {
  return 'QuizScrapResponse(userQuizId: $userQuizId, isCorrectAtScrap: $isCorrectAtScrap, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class $QuizScrapResponseCopyWith<$Res>  {
  factory $QuizScrapResponseCopyWith(QuizScrapResponse value, $Res Function(QuizScrapResponse) _then) = _$QuizScrapResponseCopyWithImpl;
@useResult
$Res call({
 int userQuizId, bool? isCorrectAtScrap, String message, String? achievementType, bool achievementCreated, bool scraped
});




}
/// @nodoc
class _$QuizScrapResponseCopyWithImpl<$Res>
    implements $QuizScrapResponseCopyWith<$Res> {
  _$QuizScrapResponseCopyWithImpl(this._self, this._then);

  final QuizScrapResponse _self;
  final $Res Function(QuizScrapResponse) _then;

/// Create a copy of QuizScrapResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuizId = null,Object? isCorrectAtScrap = freezed,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,Object? scraped = null,}) {
  return _then(_self.copyWith(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,isCorrectAtScrap: freezed == isCorrectAtScrap ? _self.isCorrectAtScrap : isCorrectAtScrap // ignore: cast_nullable_to_non_nullable
as bool?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizScrapResponse].
extension QuizScrapResponsePatterns on QuizScrapResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizScrapResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizScrapResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizScrapResponse value)  $default,){
final _that = this;
switch (_that) {
case _QuizScrapResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizScrapResponse value)?  $default,){
final _that = this;
switch (_that) {
case _QuizScrapResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuizId,  bool? isCorrectAtScrap,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizScrapResponse() when $default != null:
return $default(_that.userQuizId,_that.isCorrectAtScrap,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuizId,  bool? isCorrectAtScrap,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)  $default,) {final _that = this;
switch (_that) {
case _QuizScrapResponse():
return $default(_that.userQuizId,_that.isCorrectAtScrap,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuizId,  bool? isCorrectAtScrap,  String message,  String? achievementType,  bool achievementCreated,  bool scraped)?  $default,) {final _that = this;
switch (_that) {
case _QuizScrapResponse() when $default != null:
return $default(_that.userQuizId,_that.isCorrectAtScrap,_that.message,_that.achievementType,_that.achievementCreated,_that.scraped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizScrapResponse implements QuizScrapResponse {
  const _QuizScrapResponse({required this.userQuizId, this.isCorrectAtScrap, required this.message, this.achievementType, required this.achievementCreated, required this.scraped});
  factory _QuizScrapResponse.fromJson(Map<String, dynamic> json) => _$QuizScrapResponseFromJson(json);

@override final  int userQuizId;
@override final  bool? isCorrectAtScrap;
@override final  String message;
@override final  String? achievementType;
@override final  bool achievementCreated;
@override final  bool scraped;

/// Create a copy of QuizScrapResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizScrapResponseCopyWith<_QuizScrapResponse> get copyWith => __$QuizScrapResponseCopyWithImpl<_QuizScrapResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizScrapResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizScrapResponse&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.isCorrectAtScrap, isCorrectAtScrap) || other.isCorrectAtScrap == isCorrectAtScrap)&&(identical(other.message, message) || other.message == message)&&(identical(other.achievementType, achievementType) || other.achievementType == achievementType)&&(identical(other.achievementCreated, achievementCreated) || other.achievementCreated == achievementCreated)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,isCorrectAtScrap,message,achievementType,achievementCreated,scraped);

@override
String toString() {
  return 'QuizScrapResponse(userQuizId: $userQuizId, isCorrectAtScrap: $isCorrectAtScrap, message: $message, achievementType: $achievementType, achievementCreated: $achievementCreated, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class _$QuizScrapResponseCopyWith<$Res> implements $QuizScrapResponseCopyWith<$Res> {
  factory _$QuizScrapResponseCopyWith(_QuizScrapResponse value, $Res Function(_QuizScrapResponse) _then) = __$QuizScrapResponseCopyWithImpl;
@override @useResult
$Res call({
 int userQuizId, bool? isCorrectAtScrap, String message, String? achievementType, bool achievementCreated, bool scraped
});




}
/// @nodoc
class __$QuizScrapResponseCopyWithImpl<$Res>
    implements _$QuizScrapResponseCopyWith<$Res> {
  __$QuizScrapResponseCopyWithImpl(this._self, this._then);

  final _QuizScrapResponse _self;
  final $Res Function(_QuizScrapResponse) _then;

/// Create a copy of QuizScrapResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuizId = null,Object? isCorrectAtScrap = freezed,Object? message = null,Object? achievementType = freezed,Object? achievementCreated = null,Object? scraped = null,}) {
  return _then(_QuizScrapResponse(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,isCorrectAtScrap: freezed == isCorrectAtScrap ? _self.isCorrectAtScrap : isCorrectAtScrap // ignore: cast_nullable_to_non_nullable
as bool?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,achievementType: freezed == achievementType ? _self.achievementType : achievementType // ignore: cast_nullable_to_non_nullable
as String?,achievementCreated: null == achievementCreated ? _self.achievementCreated : achievementCreated // ignore: cast_nullable_to_non_nullable
as bool,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ScrapQuizItem {

 int get userQuizId; int? get quizId; String get scrappedDate; String get quizDate; String get quizType; String get difficulty; String get category; String get question; String get explanation; bool get isCorrectAtScrap; String get userAnswer; dynamic get oxAnswer; String? get mcqOption1; String? get mcqOption2; String? get mcqOption3; String? get mcqOption4; int? get mcqCorrectIndex; bool get scraped;
/// Create a copy of ScrapQuizItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapQuizItemCopyWith<ScrapQuizItem> get copyWith => _$ScrapQuizItemCopyWithImpl<ScrapQuizItem>(this as ScrapQuizItem, _$identity);

  /// Serializes this ScrapQuizItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapQuizItem&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.scrappedDate, scrappedDate) || other.scrappedDate == scrappedDate)&&(identical(other.quizDate, quizDate) || other.quizDate == quizDate)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.category, category) || other.category == category)&&(identical(other.question, question) || other.question == question)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.isCorrectAtScrap, isCorrectAtScrap) || other.isCorrectAtScrap == isCorrectAtScrap)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&const DeepCollectionEquality().equals(other.oxAnswer, oxAnswer)&&(identical(other.mcqOption1, mcqOption1) || other.mcqOption1 == mcqOption1)&&(identical(other.mcqOption2, mcqOption2) || other.mcqOption2 == mcqOption2)&&(identical(other.mcqOption3, mcqOption3) || other.mcqOption3 == mcqOption3)&&(identical(other.mcqOption4, mcqOption4) || other.mcqOption4 == mcqOption4)&&(identical(other.mcqCorrectIndex, mcqCorrectIndex) || other.mcqCorrectIndex == mcqCorrectIndex)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,quizId,scrappedDate,quizDate,quizType,difficulty,category,question,explanation,isCorrectAtScrap,userAnswer,const DeepCollectionEquality().hash(oxAnswer),mcqOption1,mcqOption2,mcqOption3,mcqOption4,mcqCorrectIndex,scraped);

@override
String toString() {
  return 'ScrapQuizItem(userQuizId: $userQuizId, quizId: $quizId, scrappedDate: $scrappedDate, quizDate: $quizDate, quizType: $quizType, difficulty: $difficulty, category: $category, question: $question, explanation: $explanation, isCorrectAtScrap: $isCorrectAtScrap, userAnswer: $userAnswer, oxAnswer: $oxAnswer, mcqOption1: $mcqOption1, mcqOption2: $mcqOption2, mcqOption3: $mcqOption3, mcqOption4: $mcqOption4, mcqCorrectIndex: $mcqCorrectIndex, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class $ScrapQuizItemCopyWith<$Res>  {
  factory $ScrapQuizItemCopyWith(ScrapQuizItem value, $Res Function(ScrapQuizItem) _then) = _$ScrapQuizItemCopyWithImpl;
@useResult
$Res call({
 int userQuizId, int? quizId, String scrappedDate, String quizDate, String quizType, String difficulty, String category, String question, String explanation, bool isCorrectAtScrap, String userAnswer, dynamic oxAnswer, String? mcqOption1, String? mcqOption2, String? mcqOption3, String? mcqOption4, int? mcqCorrectIndex, bool scraped
});




}
/// @nodoc
class _$ScrapQuizItemCopyWithImpl<$Res>
    implements $ScrapQuizItemCopyWith<$Res> {
  _$ScrapQuizItemCopyWithImpl(this._self, this._then);

  final ScrapQuizItem _self;
  final $Res Function(ScrapQuizItem) _then;

/// Create a copy of ScrapQuizItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuizId = null,Object? quizId = freezed,Object? scrappedDate = null,Object? quizDate = null,Object? quizType = null,Object? difficulty = null,Object? category = null,Object? question = null,Object? explanation = null,Object? isCorrectAtScrap = null,Object? userAnswer = null,Object? oxAnswer = freezed,Object? mcqOption1 = freezed,Object? mcqOption2 = freezed,Object? mcqOption3 = freezed,Object? mcqOption4 = freezed,Object? mcqCorrectIndex = freezed,Object? scraped = null,}) {
  return _then(_self.copyWith(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,quizId: freezed == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as int?,scrappedDate: null == scrappedDate ? _self.scrappedDate : scrappedDate // ignore: cast_nullable_to_non_nullable
as String,quizDate: null == quizDate ? _self.quizDate : quizDate // ignore: cast_nullable_to_non_nullable
as String,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,isCorrectAtScrap: null == isCorrectAtScrap ? _self.isCorrectAtScrap : isCorrectAtScrap // ignore: cast_nullable_to_non_nullable
as bool,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,oxAnswer: freezed == oxAnswer ? _self.oxAnswer : oxAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,mcqOption1: freezed == mcqOption1 ? _self.mcqOption1 : mcqOption1 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption2: freezed == mcqOption2 ? _self.mcqOption2 : mcqOption2 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption3: freezed == mcqOption3 ? _self.mcqOption3 : mcqOption3 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption4: freezed == mcqOption4 ? _self.mcqOption4 : mcqOption4 // ignore: cast_nullable_to_non_nullable
as String?,mcqCorrectIndex: freezed == mcqCorrectIndex ? _self.mcqCorrectIndex : mcqCorrectIndex // ignore: cast_nullable_to_non_nullable
as int?,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ScrapQuizItem].
extension ScrapQuizItemPatterns on ScrapQuizItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapQuizItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapQuizItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapQuizItem value)  $default,){
final _that = this;
switch (_that) {
case _ScrapQuizItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapQuizItem value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapQuizItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuizId,  int? quizId,  String scrappedDate,  String quizDate,  String quizType,  String difficulty,  String category,  String question,  String explanation,  bool isCorrectAtScrap,  String userAnswer,  dynamic oxAnswer,  String? mcqOption1,  String? mcqOption2,  String? mcqOption3,  String? mcqOption4,  int? mcqCorrectIndex,  bool scraped)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapQuizItem() when $default != null:
return $default(_that.userQuizId,_that.quizId,_that.scrappedDate,_that.quizDate,_that.quizType,_that.difficulty,_that.category,_that.question,_that.explanation,_that.isCorrectAtScrap,_that.userAnswer,_that.oxAnswer,_that.mcqOption1,_that.mcqOption2,_that.mcqOption3,_that.mcqOption4,_that.mcqCorrectIndex,_that.scraped);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuizId,  int? quizId,  String scrappedDate,  String quizDate,  String quizType,  String difficulty,  String category,  String question,  String explanation,  bool isCorrectAtScrap,  String userAnswer,  dynamic oxAnswer,  String? mcqOption1,  String? mcqOption2,  String? mcqOption3,  String? mcqOption4,  int? mcqCorrectIndex,  bool scraped)  $default,) {final _that = this;
switch (_that) {
case _ScrapQuizItem():
return $default(_that.userQuizId,_that.quizId,_that.scrappedDate,_that.quizDate,_that.quizType,_that.difficulty,_that.category,_that.question,_that.explanation,_that.isCorrectAtScrap,_that.userAnswer,_that.oxAnswer,_that.mcqOption1,_that.mcqOption2,_that.mcqOption3,_that.mcqOption4,_that.mcqCorrectIndex,_that.scraped);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuizId,  int? quizId,  String scrappedDate,  String quizDate,  String quizType,  String difficulty,  String category,  String question,  String explanation,  bool isCorrectAtScrap,  String userAnswer,  dynamic oxAnswer,  String? mcqOption1,  String? mcqOption2,  String? mcqOption3,  String? mcqOption4,  int? mcqCorrectIndex,  bool scraped)?  $default,) {final _that = this;
switch (_that) {
case _ScrapQuizItem() when $default != null:
return $default(_that.userQuizId,_that.quizId,_that.scrappedDate,_that.quizDate,_that.quizType,_that.difficulty,_that.category,_that.question,_that.explanation,_that.isCorrectAtScrap,_that.userAnswer,_that.oxAnswer,_that.mcqOption1,_that.mcqOption2,_that.mcqOption3,_that.mcqOption4,_that.mcqCorrectIndex,_that.scraped);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapQuizItem implements ScrapQuizItem {
  const _ScrapQuizItem({required this.userQuizId, this.quizId, required this.scrappedDate, required this.quizDate, required this.quizType, required this.difficulty, required this.category, required this.question, required this.explanation, required this.isCorrectAtScrap, required this.userAnswer, this.oxAnswer, this.mcqOption1, this.mcqOption2, this.mcqOption3, this.mcqOption4, this.mcqCorrectIndex, required this.scraped});
  factory _ScrapQuizItem.fromJson(Map<String, dynamic> json) => _$ScrapQuizItemFromJson(json);

@override final  int userQuizId;
@override final  int? quizId;
@override final  String scrappedDate;
@override final  String quizDate;
@override final  String quizType;
@override final  String difficulty;
@override final  String category;
@override final  String question;
@override final  String explanation;
@override final  bool isCorrectAtScrap;
@override final  String userAnswer;
@override final  dynamic oxAnswer;
@override final  String? mcqOption1;
@override final  String? mcqOption2;
@override final  String? mcqOption3;
@override final  String? mcqOption4;
@override final  int? mcqCorrectIndex;
@override final  bool scraped;

/// Create a copy of ScrapQuizItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapQuizItemCopyWith<_ScrapQuizItem> get copyWith => __$ScrapQuizItemCopyWithImpl<_ScrapQuizItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapQuizItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapQuizItem&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.scrappedDate, scrappedDate) || other.scrappedDate == scrappedDate)&&(identical(other.quizDate, quizDate) || other.quizDate == quizDate)&&(identical(other.quizType, quizType) || other.quizType == quizType)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.category, category) || other.category == category)&&(identical(other.question, question) || other.question == question)&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.isCorrectAtScrap, isCorrectAtScrap) || other.isCorrectAtScrap == isCorrectAtScrap)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer)&&const DeepCollectionEquality().equals(other.oxAnswer, oxAnswer)&&(identical(other.mcqOption1, mcqOption1) || other.mcqOption1 == mcqOption1)&&(identical(other.mcqOption2, mcqOption2) || other.mcqOption2 == mcqOption2)&&(identical(other.mcqOption3, mcqOption3) || other.mcqOption3 == mcqOption3)&&(identical(other.mcqOption4, mcqOption4) || other.mcqOption4 == mcqOption4)&&(identical(other.mcqCorrectIndex, mcqCorrectIndex) || other.mcqCorrectIndex == mcqCorrectIndex)&&(identical(other.scraped, scraped) || other.scraped == scraped));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,quizId,scrappedDate,quizDate,quizType,difficulty,category,question,explanation,isCorrectAtScrap,userAnswer,const DeepCollectionEquality().hash(oxAnswer),mcqOption1,mcqOption2,mcqOption3,mcqOption4,mcqCorrectIndex,scraped);

@override
String toString() {
  return 'ScrapQuizItem(userQuizId: $userQuizId, quizId: $quizId, scrappedDate: $scrappedDate, quizDate: $quizDate, quizType: $quizType, difficulty: $difficulty, category: $category, question: $question, explanation: $explanation, isCorrectAtScrap: $isCorrectAtScrap, userAnswer: $userAnswer, oxAnswer: $oxAnswer, mcqOption1: $mcqOption1, mcqOption2: $mcqOption2, mcqOption3: $mcqOption3, mcqOption4: $mcqOption4, mcqCorrectIndex: $mcqCorrectIndex, scraped: $scraped)';
}


}

/// @nodoc
abstract mixin class _$ScrapQuizItemCopyWith<$Res> implements $ScrapQuizItemCopyWith<$Res> {
  factory _$ScrapQuizItemCopyWith(_ScrapQuizItem value, $Res Function(_ScrapQuizItem) _then) = __$ScrapQuizItemCopyWithImpl;
@override @useResult
$Res call({
 int userQuizId, int? quizId, String scrappedDate, String quizDate, String quizType, String difficulty, String category, String question, String explanation, bool isCorrectAtScrap, String userAnswer, dynamic oxAnswer, String? mcqOption1, String? mcqOption2, String? mcqOption3, String? mcqOption4, int? mcqCorrectIndex, bool scraped
});




}
/// @nodoc
class __$ScrapQuizItemCopyWithImpl<$Res>
    implements _$ScrapQuizItemCopyWith<$Res> {
  __$ScrapQuizItemCopyWithImpl(this._self, this._then);

  final _ScrapQuizItem _self;
  final $Res Function(_ScrapQuizItem) _then;

/// Create a copy of ScrapQuizItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuizId = null,Object? quizId = freezed,Object? scrappedDate = null,Object? quizDate = null,Object? quizType = null,Object? difficulty = null,Object? category = null,Object? question = null,Object? explanation = null,Object? isCorrectAtScrap = null,Object? userAnswer = null,Object? oxAnswer = freezed,Object? mcqOption1 = freezed,Object? mcqOption2 = freezed,Object? mcqOption3 = freezed,Object? mcqOption4 = freezed,Object? mcqCorrectIndex = freezed,Object? scraped = null,}) {
  return _then(_ScrapQuizItem(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,quizId: freezed == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as int?,scrappedDate: null == scrappedDate ? _self.scrappedDate : scrappedDate // ignore: cast_nullable_to_non_nullable
as String,quizDate: null == quizDate ? _self.quizDate : quizDate // ignore: cast_nullable_to_non_nullable
as String,quizType: null == quizType ? _self.quizType : quizType // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,isCorrectAtScrap: null == isCorrectAtScrap ? _self.isCorrectAtScrap : isCorrectAtScrap // ignore: cast_nullable_to_non_nullable
as bool,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,oxAnswer: freezed == oxAnswer ? _self.oxAnswer : oxAnswer // ignore: cast_nullable_to_non_nullable
as dynamic,mcqOption1: freezed == mcqOption1 ? _self.mcqOption1 : mcqOption1 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption2: freezed == mcqOption2 ? _self.mcqOption2 : mcqOption2 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption3: freezed == mcqOption3 ? _self.mcqOption3 : mcqOption3 // ignore: cast_nullable_to_non_nullable
as String?,mcqOption4: freezed == mcqOption4 ? _self.mcqOption4 : mcqOption4 // ignore: cast_nullable_to_non_nullable
as String?,mcqCorrectIndex: freezed == mcqCorrectIndex ? _self.mcqCorrectIndex : mcqCorrectIndex // ignore: cast_nullable_to_non_nullable
as int?,scraped: null == scraped ? _self.scraped : scraped // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ScrapQuizPageResponse {

 int get page; List<ScrapQuizItem> get content; int get size; int get totalElements; int get totalPages; bool get first; bool get last; bool get hasNext; bool get hasPrevious;
/// Create a copy of ScrapQuizPageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScrapQuizPageResponseCopyWith<ScrapQuizPageResponse> get copyWith => _$ScrapQuizPageResponseCopyWithImpl<ScrapQuizPageResponse>(this as ScrapQuizPageResponse, _$identity);

  /// Serializes this ScrapQuizPageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScrapQuizPageResponse&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other.content, content)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(content),size,totalElements,totalPages,first,last,hasNext,hasPrevious);

@override
String toString() {
  return 'ScrapQuizPageResponse(page: $page, content: $content, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, hasNext: $hasNext, hasPrevious: $hasPrevious)';
}


}

/// @nodoc
abstract mixin class $ScrapQuizPageResponseCopyWith<$Res>  {
  factory $ScrapQuizPageResponseCopyWith(ScrapQuizPageResponse value, $Res Function(ScrapQuizPageResponse) _then) = _$ScrapQuizPageResponseCopyWithImpl;
@useResult
$Res call({
 int page, List<ScrapQuizItem> content, int size, int totalElements, int totalPages, bool first, bool last, bool hasNext, bool hasPrevious
});




}
/// @nodoc
class _$ScrapQuizPageResponseCopyWithImpl<$Res>
    implements $ScrapQuizPageResponseCopyWith<$Res> {
  _$ScrapQuizPageResponseCopyWithImpl(this._self, this._then);

  final ScrapQuizPageResponse _self;
  final $Res Function(ScrapQuizPageResponse) _then;

/// Create a copy of ScrapQuizPageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? content = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,Object? hasNext = null,Object? hasPrevious = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as List<ScrapQuizItem>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [ScrapQuizPageResponse].
extension ScrapQuizPageResponsePatterns on ScrapQuizPageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScrapQuizPageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScrapQuizPageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScrapQuizPageResponse value)  $default,){
final _that = this;
switch (_that) {
case _ScrapQuizPageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScrapQuizPageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ScrapQuizPageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page,  List<ScrapQuizItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScrapQuizPageResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page,  List<ScrapQuizItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)  $default,) {final _that = this;
switch (_that) {
case _ScrapQuizPageResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page,  List<ScrapQuizItem> content,  int size,  int totalElements,  int totalPages,  bool first,  bool last,  bool hasNext,  bool hasPrevious)?  $default,) {final _that = this;
switch (_that) {
case _ScrapQuizPageResponse() when $default != null:
return $default(_that.page,_that.content,_that.size,_that.totalElements,_that.totalPages,_that.first,_that.last,_that.hasNext,_that.hasPrevious);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScrapQuizPageResponse implements ScrapQuizPageResponse {
  const _ScrapQuizPageResponse({required this.page, required final  List<ScrapQuizItem> content, required this.size, required this.totalElements, required this.totalPages, required this.first, required this.last, required this.hasNext, required this.hasPrevious}): _content = content;
  factory _ScrapQuizPageResponse.fromJson(Map<String, dynamic> json) => _$ScrapQuizPageResponseFromJson(json);

@override final  int page;
 final  List<ScrapQuizItem> _content;
@override List<ScrapQuizItem> get content {
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

/// Create a copy of ScrapQuizPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScrapQuizPageResponseCopyWith<_ScrapQuizPageResponse> get copyWith => __$ScrapQuizPageResponseCopyWithImpl<_ScrapQuizPageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScrapQuizPageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScrapQuizPageResponse&&(identical(other.page, page) || other.page == page)&&const DeepCollectionEquality().equals(other._content, _content)&&(identical(other.size, size) || other.size == size)&&(identical(other.totalElements, totalElements) || other.totalElements == totalElements)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.first, first) || other.first == first)&&(identical(other.last, last) || other.last == last)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.hasPrevious, hasPrevious) || other.hasPrevious == hasPrevious));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,const DeepCollectionEquality().hash(_content),size,totalElements,totalPages,first,last,hasNext,hasPrevious);

@override
String toString() {
  return 'ScrapQuizPageResponse(page: $page, content: $content, size: $size, totalElements: $totalElements, totalPages: $totalPages, first: $first, last: $last, hasNext: $hasNext, hasPrevious: $hasPrevious)';
}


}

/// @nodoc
abstract mixin class _$ScrapQuizPageResponseCopyWith<$Res> implements $ScrapQuizPageResponseCopyWith<$Res> {
  factory _$ScrapQuizPageResponseCopyWith(_ScrapQuizPageResponse value, $Res Function(_ScrapQuizPageResponse) _then) = __$ScrapQuizPageResponseCopyWithImpl;
@override @useResult
$Res call({
 int page, List<ScrapQuizItem> content, int size, int totalElements, int totalPages, bool first, bool last, bool hasNext, bool hasPrevious
});




}
/// @nodoc
class __$ScrapQuizPageResponseCopyWithImpl<$Res>
    implements _$ScrapQuizPageResponseCopyWith<$Res> {
  __$ScrapQuizPageResponseCopyWithImpl(this._self, this._then);

  final _ScrapQuizPageResponse _self;
  final $Res Function(_ScrapQuizPageResponse) _then;

/// Create a copy of ScrapQuizPageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? content = null,Object? size = null,Object? totalElements = null,Object? totalPages = null,Object? first = null,Object? last = null,Object? hasNext = null,Object? hasPrevious = null,}) {
  return _then(_ScrapQuizPageResponse(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self._content : content // ignore: cast_nullable_to_non_nullable
as List<ScrapQuizItem>,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
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
