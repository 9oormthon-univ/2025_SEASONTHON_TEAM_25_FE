// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementItem {

 int get achievementId; String get type; String get title; String get description; String get iconUrl; int get requirementCount; bool get claimed;
/// Create a copy of AchievementItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementItemCopyWith<AchievementItem> get copyWith => _$AchievementItemCopyWithImpl<AchievementItem>(this as AchievementItem, _$identity);

  /// Serializes this AchievementItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementItem&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.requirementCount, requirementCount) || other.requirementCount == requirementCount)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,achievementId,type,title,description,iconUrl,requirementCount,claimed);

@override
String toString() {
  return 'AchievementItem(achievementId: $achievementId, type: $type, title: $title, description: $description, iconUrl: $iconUrl, requirementCount: $requirementCount, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class $AchievementItemCopyWith<$Res>  {
  factory $AchievementItemCopyWith(AchievementItem value, $Res Function(AchievementItem) _then) = _$AchievementItemCopyWithImpl;
@useResult
$Res call({
 int achievementId, String type, String title, String description, String iconUrl, int requirementCount, bool claimed
});




}
/// @nodoc
class _$AchievementItemCopyWithImpl<$Res>
    implements $AchievementItemCopyWith<$Res> {
  _$AchievementItemCopyWithImpl(this._self, this._then);

  final AchievementItem _self;
  final $Res Function(AchievementItem) _then;

/// Create a copy of AchievementItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievementId = null,Object? type = null,Object? title = null,Object? description = null,Object? iconUrl = null,Object? requirementCount = null,Object? claimed = null,}) {
  return _then(_self.copyWith(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,requirementCount: null == requirementCount ? _self.requirementCount : requirementCount // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementItem].
extension AchievementItemPatterns on AchievementItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementItem value)  $default,){
final _that = this;
switch (_that) {
case _AchievementItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementItem value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  int requirementCount,  bool claimed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementItem() when $default != null:
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.requirementCount,_that.claimed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  int requirementCount,  bool claimed)  $default,) {final _that = this;
switch (_that) {
case _AchievementItem():
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.requirementCount,_that.claimed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  int requirementCount,  bool claimed)?  $default,) {final _that = this;
switch (_that) {
case _AchievementItem() when $default != null:
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.requirementCount,_that.claimed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementItem implements AchievementItem {
  const _AchievementItem({required this.achievementId, required this.type, required this.title, required this.description, required this.iconUrl, required this.requirementCount, required this.claimed});
  factory _AchievementItem.fromJson(Map<String, dynamic> json) => _$AchievementItemFromJson(json);

@override final  int achievementId;
@override final  String type;
@override final  String title;
@override final  String description;
@override final  String iconUrl;
@override final  int requirementCount;
@override final  bool claimed;

/// Create a copy of AchievementItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementItemCopyWith<_AchievementItem> get copyWith => __$AchievementItemCopyWithImpl<_AchievementItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementItem&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.requirementCount, requirementCount) || other.requirementCount == requirementCount)&&(identical(other.claimed, claimed) || other.claimed == claimed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,achievementId,type,title,description,iconUrl,requirementCount,claimed);

@override
String toString() {
  return 'AchievementItem(achievementId: $achievementId, type: $type, title: $title, description: $description, iconUrl: $iconUrl, requirementCount: $requirementCount, claimed: $claimed)';
}


}

/// @nodoc
abstract mixin class _$AchievementItemCopyWith<$Res> implements $AchievementItemCopyWith<$Res> {
  factory _$AchievementItemCopyWith(_AchievementItem value, $Res Function(_AchievementItem) _then) = __$AchievementItemCopyWithImpl;
@override @useResult
$Res call({
 int achievementId, String type, String title, String description, String iconUrl, int requirementCount, bool claimed
});




}
/// @nodoc
class __$AchievementItemCopyWithImpl<$Res>
    implements _$AchievementItemCopyWith<$Res> {
  __$AchievementItemCopyWithImpl(this._self, this._then);

  final _AchievementItem _self;
  final $Res Function(_AchievementItem) _then;

/// Create a copy of AchievementItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievementId = null,Object? type = null,Object? title = null,Object? description = null,Object? iconUrl = null,Object? requirementCount = null,Object? claimed = null,}) {
  return _then(_AchievementItem(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,requirementCount: null == requirementCount ? _self.requirementCount : requirementCount // ignore: cast_nullable_to_non_nullable
as int,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AchievementListResponse {

 List<AchievementItem> get achievements;
/// Create a copy of AchievementListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementListResponseCopyWith<AchievementListResponse> get copyWith => _$AchievementListResponseCopyWithImpl<AchievementListResponse>(this as AchievementListResponse, _$identity);

  /// Serializes this AchievementListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementListResponse&&const DeepCollectionEquality().equals(other.achievements, achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(achievements));

@override
String toString() {
  return 'AchievementListResponse(achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class $AchievementListResponseCopyWith<$Res>  {
  factory $AchievementListResponseCopyWith(AchievementListResponse value, $Res Function(AchievementListResponse) _then) = _$AchievementListResponseCopyWithImpl;
@useResult
$Res call({
 List<AchievementItem> achievements
});




}
/// @nodoc
class _$AchievementListResponseCopyWithImpl<$Res>
    implements $AchievementListResponseCopyWith<$Res> {
  _$AchievementListResponseCopyWithImpl(this._self, this._then);

  final AchievementListResponse _self;
  final $Res Function(AchievementListResponse) _then;

/// Create a copy of AchievementListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievements = null,}) {
  return _then(_self.copyWith(
achievements: null == achievements ? _self.achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<AchievementItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementListResponse].
extension AchievementListResponsePatterns on AchievementListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AchievementListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AchievementItem> achievements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementListResponse() when $default != null:
return $default(_that.achievements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AchievementItem> achievements)  $default,) {final _that = this;
switch (_that) {
case _AchievementListResponse():
return $default(_that.achievements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AchievementItem> achievements)?  $default,) {final _that = this;
switch (_that) {
case _AchievementListResponse() when $default != null:
return $default(_that.achievements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementListResponse implements AchievementListResponse {
  const _AchievementListResponse({required final  List<AchievementItem> achievements}): _achievements = achievements;
  factory _AchievementListResponse.fromJson(Map<String, dynamic> json) => _$AchievementListResponseFromJson(json);

 final  List<AchievementItem> _achievements;
@override List<AchievementItem> get achievements {
  if (_achievements is EqualUnmodifiableListView) return _achievements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievements);
}


/// Create a copy of AchievementListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementListResponseCopyWith<_AchievementListResponse> get copyWith => __$AchievementListResponseCopyWithImpl<_AchievementListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementListResponse&&const DeepCollectionEquality().equals(other._achievements, _achievements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_achievements));

@override
String toString() {
  return 'AchievementListResponse(achievements: $achievements)';
}


}

/// @nodoc
abstract mixin class _$AchievementListResponseCopyWith<$Res> implements $AchievementListResponseCopyWith<$Res> {
  factory _$AchievementListResponseCopyWith(_AchievementListResponse value, $Res Function(_AchievementListResponse) _then) = __$AchievementListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AchievementItem> achievements
});




}
/// @nodoc
class __$AchievementListResponseCopyWithImpl<$Res>
    implements _$AchievementListResponseCopyWith<$Res> {
  __$AchievementListResponseCopyWithImpl(this._self, this._then);

  final _AchievementListResponse _self;
  final $Res Function(_AchievementListResponse) _then;

/// Create a copy of AchievementListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievements = null,}) {
  return _then(_AchievementListResponse(
achievements: null == achievements ? _self._achievements : achievements // ignore: cast_nullable_to_non_nullable
as List<AchievementItem>,
  ));
}


}


/// @nodoc
mixin _$ClaimAchievementResponse {

 int get achievementId; String get type; String get title; String get description; String get iconUrl; bool get claimed; String get message;
/// Create a copy of ClaimAchievementResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimAchievementResponseCopyWith<ClaimAchievementResponse> get copyWith => _$ClaimAchievementResponseCopyWithImpl<ClaimAchievementResponse>(this as ClaimAchievementResponse, _$identity);

  /// Serializes this ClaimAchievementResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimAchievementResponse&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,achievementId,type,title,description,iconUrl,claimed,message);

@override
String toString() {
  return 'ClaimAchievementResponse(achievementId: $achievementId, type: $type, title: $title, description: $description, iconUrl: $iconUrl, claimed: $claimed, message: $message)';
}


}

/// @nodoc
abstract mixin class $ClaimAchievementResponseCopyWith<$Res>  {
  factory $ClaimAchievementResponseCopyWith(ClaimAchievementResponse value, $Res Function(ClaimAchievementResponse) _then) = _$ClaimAchievementResponseCopyWithImpl;
@useResult
$Res call({
 int achievementId, String type, String title, String description, String iconUrl, bool claimed, String message
});




}
/// @nodoc
class _$ClaimAchievementResponseCopyWithImpl<$Res>
    implements $ClaimAchievementResponseCopyWith<$Res> {
  _$ClaimAchievementResponseCopyWithImpl(this._self, this._then);

  final ClaimAchievementResponse _self;
  final $Res Function(ClaimAchievementResponse) _then;

/// Create a copy of ClaimAchievementResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? achievementId = null,Object? type = null,Object? title = null,Object? description = null,Object? iconUrl = null,Object? claimed = null,Object? message = null,}) {
  return _then(_self.copyWith(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimAchievementResponse].
extension ClaimAchievementResponsePatterns on ClaimAchievementResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimAchievementResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimAchievementResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimAchievementResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClaimAchievementResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimAchievementResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimAchievementResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  bool claimed,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimAchievementResponse() when $default != null:
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.claimed,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  bool claimed,  String message)  $default,) {final _that = this;
switch (_that) {
case _ClaimAchievementResponse():
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.claimed,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int achievementId,  String type,  String title,  String description,  String iconUrl,  bool claimed,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ClaimAchievementResponse() when $default != null:
return $default(_that.achievementId,_that.type,_that.title,_that.description,_that.iconUrl,_that.claimed,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimAchievementResponse implements ClaimAchievementResponse {
  const _ClaimAchievementResponse({required this.achievementId, required this.type, required this.title, required this.description, required this.iconUrl, required this.claimed, required this.message});
  factory _ClaimAchievementResponse.fromJson(Map<String, dynamic> json) => _$ClaimAchievementResponseFromJson(json);

@override final  int achievementId;
@override final  String type;
@override final  String title;
@override final  String description;
@override final  String iconUrl;
@override final  bool claimed;
@override final  String message;

/// Create a copy of ClaimAchievementResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimAchievementResponseCopyWith<_ClaimAchievementResponse> get copyWith => __$ClaimAchievementResponseCopyWithImpl<_ClaimAchievementResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimAchievementResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimAchievementResponse&&(identical(other.achievementId, achievementId) || other.achievementId == achievementId)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,achievementId,type,title,description,iconUrl,claimed,message);

@override
String toString() {
  return 'ClaimAchievementResponse(achievementId: $achievementId, type: $type, title: $title, description: $description, iconUrl: $iconUrl, claimed: $claimed, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ClaimAchievementResponseCopyWith<$Res> implements $ClaimAchievementResponseCopyWith<$Res> {
  factory _$ClaimAchievementResponseCopyWith(_ClaimAchievementResponse value, $Res Function(_ClaimAchievementResponse) _then) = __$ClaimAchievementResponseCopyWithImpl;
@override @useResult
$Res call({
 int achievementId, String type, String title, String description, String iconUrl, bool claimed, String message
});




}
/// @nodoc
class __$ClaimAchievementResponseCopyWithImpl<$Res>
    implements _$ClaimAchievementResponseCopyWith<$Res> {
  __$ClaimAchievementResponseCopyWithImpl(this._self, this._then);

  final _ClaimAchievementResponse _self;
  final $Res Function(_ClaimAchievementResponse) _then;

/// Create a copy of ClaimAchievementResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? achievementId = null,Object? type = null,Object? title = null,Object? description = null,Object? iconUrl = null,Object? claimed = null,Object? message = null,}) {
  return _then(_ClaimAchievementResponse(
achievementId: null == achievementId ? _self.achievementId : achievementId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
