// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestItem {

 int get userQuestId; String get title; String get description; String get periodStart; String get periodEnd; int get requirementCount; int get progressCount; int get currentStreak; bool get completed; bool get claimed; double get rewardAmount;
/// Create a copy of QuestItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestItemCopyWith<QuestItem> get copyWith => _$QuestItemCopyWithImpl<QuestItem>(this as QuestItem, _$identity);

  /// Serializes this QuestItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestItem&&(identical(other.userQuestId, userQuestId) || other.userQuestId == userQuestId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.requirementCount, requirementCount) || other.requirementCount == requirementCount)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuestId,title,description,periodStart,periodEnd,requirementCount,progressCount,currentStreak,completed,claimed,rewardAmount);

@override
String toString() {
  return 'QuestItem(userQuestId: $userQuestId, title: $title, description: $description, periodStart: $periodStart, periodEnd: $periodEnd, requirementCount: $requirementCount, progressCount: $progressCount, currentStreak: $currentStreak, completed: $completed, claimed: $claimed, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class $QuestItemCopyWith<$Res>  {
  factory $QuestItemCopyWith(QuestItem value, $Res Function(QuestItem) _then) = _$QuestItemCopyWithImpl;
@useResult
$Res call({
 int userQuestId, String title, String description, String periodStart, String periodEnd, int requirementCount, int progressCount, int currentStreak, bool completed, bool claimed, double rewardAmount
});




}
/// @nodoc
class _$QuestItemCopyWithImpl<$Res>
    implements $QuestItemCopyWith<$Res> {
  _$QuestItemCopyWithImpl(this._self, this._then);

  final QuestItem _self;
  final $Res Function(QuestItem) _then;

/// Create a copy of QuestItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuestId = null,Object? title = null,Object? description = null,Object? periodStart = null,Object? periodEnd = null,Object? requirementCount = null,Object? progressCount = null,Object? currentStreak = null,Object? completed = null,Object? claimed = null,Object? rewardAmount = null,}) {
  return _then(_self.copyWith(
userQuestId: null == userQuestId ? _self.userQuestId : userQuestId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,requirementCount: null == requirementCount ? _self.requirementCount : requirementCount // ignore: cast_nullable_to_non_nullable
as int,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,rewardAmount: null == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestItem].
extension QuestItemPatterns on QuestItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestItem value)  $default,){
final _that = this;
switch (_that) {
case _QuestItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestItem value)?  $default,){
final _that = this;
switch (_that) {
case _QuestItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuestId,  String title,  String description,  String periodStart,  String periodEnd,  int requirementCount,  int progressCount,  int currentStreak,  bool completed,  bool claimed,  double rewardAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestItem() when $default != null:
return $default(_that.userQuestId,_that.title,_that.description,_that.periodStart,_that.periodEnd,_that.requirementCount,_that.progressCount,_that.currentStreak,_that.completed,_that.claimed,_that.rewardAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuestId,  String title,  String description,  String periodStart,  String periodEnd,  int requirementCount,  int progressCount,  int currentStreak,  bool completed,  bool claimed,  double rewardAmount)  $default,) {final _that = this;
switch (_that) {
case _QuestItem():
return $default(_that.userQuestId,_that.title,_that.description,_that.periodStart,_that.periodEnd,_that.requirementCount,_that.progressCount,_that.currentStreak,_that.completed,_that.claimed,_that.rewardAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuestId,  String title,  String description,  String periodStart,  String periodEnd,  int requirementCount,  int progressCount,  int currentStreak,  bool completed,  bool claimed,  double rewardAmount)?  $default,) {final _that = this;
switch (_that) {
case _QuestItem() when $default != null:
return $default(_that.userQuestId,_that.title,_that.description,_that.periodStart,_that.periodEnd,_that.requirementCount,_that.progressCount,_that.currentStreak,_that.completed,_that.claimed,_that.rewardAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestItem implements QuestItem {
  const _QuestItem({required this.userQuestId, required this.title, required this.description, required this.periodStart, required this.periodEnd, required this.requirementCount, required this.progressCount, required this.currentStreak, required this.completed, required this.claimed, required this.rewardAmount});
  factory _QuestItem.fromJson(Map<String, dynamic> json) => _$QuestItemFromJson(json);

@override final  int userQuestId;
@override final  String title;
@override final  String description;
@override final  String periodStart;
@override final  String periodEnd;
@override final  int requirementCount;
@override final  int progressCount;
@override final  int currentStreak;
@override final  bool completed;
@override final  bool claimed;
@override final  double rewardAmount;

/// Create a copy of QuestItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestItemCopyWith<_QuestItem> get copyWith => __$QuestItemCopyWithImpl<_QuestItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestItem&&(identical(other.userQuestId, userQuestId) || other.userQuestId == userQuestId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.requirementCount, requirementCount) || other.requirementCount == requirementCount)&&(identical(other.progressCount, progressCount) || other.progressCount == progressCount)&&(identical(other.currentStreak, currentStreak) || other.currentStreak == currentStreak)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.claimed, claimed) || other.claimed == claimed)&&(identical(other.rewardAmount, rewardAmount) || other.rewardAmount == rewardAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuestId,title,description,periodStart,periodEnd,requirementCount,progressCount,currentStreak,completed,claimed,rewardAmount);

@override
String toString() {
  return 'QuestItem(userQuestId: $userQuestId, title: $title, description: $description, periodStart: $periodStart, periodEnd: $periodEnd, requirementCount: $requirementCount, progressCount: $progressCount, currentStreak: $currentStreak, completed: $completed, claimed: $claimed, rewardAmount: $rewardAmount)';
}


}

/// @nodoc
abstract mixin class _$QuestItemCopyWith<$Res> implements $QuestItemCopyWith<$Res> {
  factory _$QuestItemCopyWith(_QuestItem value, $Res Function(_QuestItem) _then) = __$QuestItemCopyWithImpl;
@override @useResult
$Res call({
 int userQuestId, String title, String description, String periodStart, String periodEnd, int requirementCount, int progressCount, int currentStreak, bool completed, bool claimed, double rewardAmount
});




}
/// @nodoc
class __$QuestItemCopyWithImpl<$Res>
    implements _$QuestItemCopyWith<$Res> {
  __$QuestItemCopyWithImpl(this._self, this._then);

  final _QuestItem _self;
  final $Res Function(_QuestItem) _then;

/// Create a copy of QuestItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuestId = null,Object? title = null,Object? description = null,Object? periodStart = null,Object? periodEnd = null,Object? requirementCount = null,Object? progressCount = null,Object? currentStreak = null,Object? completed = null,Object? claimed = null,Object? rewardAmount = null,}) {
  return _then(_QuestItem(
userQuestId: null == userQuestId ? _self.userQuestId : userQuestId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,requirementCount: null == requirementCount ? _self.requirementCount : requirementCount // ignore: cast_nullable_to_non_nullable
as int,progressCount: null == progressCount ? _self.progressCount : progressCount // ignore: cast_nullable_to_non_nullable
as int,currentStreak: null == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as int,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,claimed: null == claimed ? _self.claimed : claimed // ignore: cast_nullable_to_non_nullable
as bool,rewardAmount: null == rewardAmount ? _self.rewardAmount : rewardAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ClaimQuestRewardResponse {

 bool get completed; int get userQuestId; String get message;
/// Create a copy of ClaimQuestRewardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClaimQuestRewardResponseCopyWith<ClaimQuestRewardResponse> get copyWith => _$ClaimQuestRewardResponseCopyWithImpl<ClaimQuestRewardResponse>(this as ClaimQuestRewardResponse, _$identity);

  /// Serializes this ClaimQuestRewardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClaimQuestRewardResponse&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.userQuestId, userQuestId) || other.userQuestId == userQuestId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completed,userQuestId,message);

@override
String toString() {
  return 'ClaimQuestRewardResponse(completed: $completed, userQuestId: $userQuestId, message: $message)';
}


}

/// @nodoc
abstract mixin class $ClaimQuestRewardResponseCopyWith<$Res>  {
  factory $ClaimQuestRewardResponseCopyWith(ClaimQuestRewardResponse value, $Res Function(ClaimQuestRewardResponse) _then) = _$ClaimQuestRewardResponseCopyWithImpl;
@useResult
$Res call({
 bool completed, int userQuestId, String message
});




}
/// @nodoc
class _$ClaimQuestRewardResponseCopyWithImpl<$Res>
    implements $ClaimQuestRewardResponseCopyWith<$Res> {
  _$ClaimQuestRewardResponseCopyWithImpl(this._self, this._then);

  final ClaimQuestRewardResponse _self;
  final $Res Function(ClaimQuestRewardResponse) _then;

/// Create a copy of ClaimQuestRewardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completed = null,Object? userQuestId = null,Object? message = null,}) {
  return _then(_self.copyWith(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,userQuestId: null == userQuestId ? _self.userQuestId : userQuestId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ClaimQuestRewardResponse].
extension ClaimQuestRewardResponsePatterns on ClaimQuestRewardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClaimQuestRewardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClaimQuestRewardResponse value)  $default,){
final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClaimQuestRewardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool completed,  int userQuestId,  String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse() when $default != null:
return $default(_that.completed,_that.userQuestId,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool completed,  int userQuestId,  String message)  $default,) {final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse():
return $default(_that.completed,_that.userQuestId,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool completed,  int userQuestId,  String message)?  $default,) {final _that = this;
switch (_that) {
case _ClaimQuestRewardResponse() when $default != null:
return $default(_that.completed,_that.userQuestId,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClaimQuestRewardResponse implements ClaimQuestRewardResponse {
  const _ClaimQuestRewardResponse({required this.completed, required this.userQuestId, required this.message});
  factory _ClaimQuestRewardResponse.fromJson(Map<String, dynamic> json) => _$ClaimQuestRewardResponseFromJson(json);

@override final  bool completed;
@override final  int userQuestId;
@override final  String message;

/// Create a copy of ClaimQuestRewardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClaimQuestRewardResponseCopyWith<_ClaimQuestRewardResponse> get copyWith => __$ClaimQuestRewardResponseCopyWithImpl<_ClaimQuestRewardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClaimQuestRewardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClaimQuestRewardResponse&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.userQuestId, userQuestId) || other.userQuestId == userQuestId)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completed,userQuestId,message);

@override
String toString() {
  return 'ClaimQuestRewardResponse(completed: $completed, userQuestId: $userQuestId, message: $message)';
}


}

/// @nodoc
abstract mixin class _$ClaimQuestRewardResponseCopyWith<$Res> implements $ClaimQuestRewardResponseCopyWith<$Res> {
  factory _$ClaimQuestRewardResponseCopyWith(_ClaimQuestRewardResponse value, $Res Function(_ClaimQuestRewardResponse) _then) = __$ClaimQuestRewardResponseCopyWithImpl;
@override @useResult
$Res call({
 bool completed, int userQuestId, String message
});




}
/// @nodoc
class __$ClaimQuestRewardResponseCopyWithImpl<$Res>
    implements _$ClaimQuestRewardResponseCopyWith<$Res> {
  __$ClaimQuestRewardResponseCopyWithImpl(this._self, this._then);

  final _ClaimQuestRewardResponse _self;
  final $Res Function(_ClaimQuestRewardResponse) _then;

/// Create a copy of ClaimQuestRewardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completed = null,Object? userQuestId = null,Object? message = null,}) {
  return _then(_ClaimQuestRewardResponse(
completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,userQuestId: null == userQuestId ? _self.userQuestId : userQuestId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
