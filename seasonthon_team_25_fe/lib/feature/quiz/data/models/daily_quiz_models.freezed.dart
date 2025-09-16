// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_quiz_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DailyQuizItem {

 int get userQuizId; int get quizId; QuizType get type; String get question; List<String> get mcqOptions;
/// Create a copy of DailyQuizItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyQuizItemCopyWith<DailyQuizItem> get copyWith => _$DailyQuizItemCopyWithImpl<DailyQuizItem>(this as DailyQuizItem, _$identity);

  /// Serializes this DailyQuizItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuizItem&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.type, type) || other.type == type)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other.mcqOptions, mcqOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,quizId,type,question,const DeepCollectionEquality().hash(mcqOptions));

@override
String toString() {
  return 'DailyQuizItem(userQuizId: $userQuizId, quizId: $quizId, type: $type, question: $question, mcqOptions: $mcqOptions)';
}


}

/// @nodoc
abstract mixin class $DailyQuizItemCopyWith<$Res>  {
  factory $DailyQuizItemCopyWith(DailyQuizItem value, $Res Function(DailyQuizItem) _then) = _$DailyQuizItemCopyWithImpl;
@useResult
$Res call({
 int userQuizId, int quizId, QuizType type, String question, List<String> mcqOptions
});




}
/// @nodoc
class _$DailyQuizItemCopyWithImpl<$Res>
    implements $DailyQuizItemCopyWith<$Res> {
  _$DailyQuizItemCopyWithImpl(this._self, this._then);

  final DailyQuizItem _self;
  final $Res Function(DailyQuizItem) _then;

/// Create a copy of DailyQuizItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuizId = null,Object? quizId = null,Object? type = null,Object? question = null,Object? mcqOptions = null,}) {
  return _then(_self.copyWith(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizType,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,mcqOptions: null == mcqOptions ? _self.mcqOptions : mcqOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyQuizItem].
extension DailyQuizItemPatterns on DailyQuizItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyQuizItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyQuizItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyQuizItem value)  $default,){
final _that = this;
switch (_that) {
case _DailyQuizItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyQuizItem value)?  $default,){
final _that = this;
switch (_that) {
case _DailyQuizItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuizId,  int quizId,  QuizType type,  String question,  List<String> mcqOptions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyQuizItem() when $default != null:
return $default(_that.userQuizId,_that.quizId,_that.type,_that.question,_that.mcqOptions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuizId,  int quizId,  QuizType type,  String question,  List<String> mcqOptions)  $default,) {final _that = this;
switch (_that) {
case _DailyQuizItem():
return $default(_that.userQuizId,_that.quizId,_that.type,_that.question,_that.mcqOptions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuizId,  int quizId,  QuizType type,  String question,  List<String> mcqOptions)?  $default,) {final _that = this;
switch (_that) {
case _DailyQuizItem() when $default != null:
return $default(_that.userQuizId,_that.quizId,_that.type,_that.question,_that.mcqOptions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyQuizItem implements DailyQuizItem {
  const _DailyQuizItem({required this.userQuizId, required this.quizId, required this.type, required this.question, final  List<String> mcqOptions = const <String>[]}): _mcqOptions = mcqOptions;
  factory _DailyQuizItem.fromJson(Map<String, dynamic> json) => _$DailyQuizItemFromJson(json);

@override final  int userQuizId;
@override final  int quizId;
@override final  QuizType type;
@override final  String question;
 final  List<String> _mcqOptions;
@override@JsonKey() List<String> get mcqOptions {
  if (_mcqOptions is EqualUnmodifiableListView) return _mcqOptions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_mcqOptions);
}


/// Create a copy of DailyQuizItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyQuizItemCopyWith<_DailyQuizItem> get copyWith => __$DailyQuizItemCopyWithImpl<_DailyQuizItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyQuizItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyQuizItem&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.type, type) || other.type == type)&&(identical(other.question, question) || other.question == question)&&const DeepCollectionEquality().equals(other._mcqOptions, _mcqOptions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,quizId,type,question,const DeepCollectionEquality().hash(_mcqOptions));

@override
String toString() {
  return 'DailyQuizItem(userQuizId: $userQuizId, quizId: $quizId, type: $type, question: $question, mcqOptions: $mcqOptions)';
}


}

/// @nodoc
abstract mixin class _$DailyQuizItemCopyWith<$Res> implements $DailyQuizItemCopyWith<$Res> {
  factory _$DailyQuizItemCopyWith(_DailyQuizItem value, $Res Function(_DailyQuizItem) _then) = __$DailyQuizItemCopyWithImpl;
@override @useResult
$Res call({
 int userQuizId, int quizId, QuizType type, String question, List<String> mcqOptions
});




}
/// @nodoc
class __$DailyQuizItemCopyWithImpl<$Res>
    implements _$DailyQuizItemCopyWith<$Res> {
  __$DailyQuizItemCopyWithImpl(this._self, this._then);

  final _DailyQuizItem _self;
  final $Res Function(_DailyQuizItem) _then;

/// Create a copy of DailyQuizItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuizId = null,Object? quizId = null,Object? type = null,Object? question = null,Object? mcqOptions = null,}) {
  return _then(_DailyQuizItem(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as QuizType,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,mcqOptions: null == mcqOptions ? _self._mcqOptions : mcqOptions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$DailyQuizResponse {

 List<DailyQuizItem> get quizzes; bool get completed;
/// Create a copy of DailyQuizResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyQuizResponseCopyWith<DailyQuizResponse> get copyWith => _$DailyQuizResponseCopyWithImpl<DailyQuizResponse>(this as DailyQuizResponse, _$identity);

  /// Serializes this DailyQuizResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuizResponse&&const DeepCollectionEquality().equals(other.quizzes, quizzes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(quizzes),completed);

@override
String toString() {
  return 'DailyQuizResponse(quizzes: $quizzes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $DailyQuizResponseCopyWith<$Res>  {
  factory $DailyQuizResponseCopyWith(DailyQuizResponse value, $Res Function(DailyQuizResponse) _then) = _$DailyQuizResponseCopyWithImpl;
@useResult
$Res call({
 List<DailyQuizItem> quizzes, bool completed
});




}
/// @nodoc
class _$DailyQuizResponseCopyWithImpl<$Res>
    implements $DailyQuizResponseCopyWith<$Res> {
  _$DailyQuizResponseCopyWithImpl(this._self, this._then);

  final DailyQuizResponse _self;
  final $Res Function(DailyQuizResponse) _then;

/// Create a copy of DailyQuizResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? quizzes = null,Object? completed = null,}) {
  return _then(_self.copyWith(
quizzes: null == quizzes ? _self.quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<DailyQuizItem>,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyQuizResponse].
extension DailyQuizResponsePatterns on DailyQuizResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyQuizResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyQuizResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyQuizResponse value)  $default,){
final _that = this;
switch (_that) {
case _DailyQuizResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyQuizResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DailyQuizResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<DailyQuizItem> quizzes,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyQuizResponse() when $default != null:
return $default(_that.quizzes,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<DailyQuizItem> quizzes,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _DailyQuizResponse():
return $default(_that.quizzes,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<DailyQuizItem> quizzes,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _DailyQuizResponse() when $default != null:
return $default(_that.quizzes,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyQuizResponse implements DailyQuizResponse {
  const _DailyQuizResponse({required final  List<DailyQuizItem> quizzes, required this.completed}): _quizzes = quizzes;
  factory _DailyQuizResponse.fromJson(Map<String, dynamic> json) => _$DailyQuizResponseFromJson(json);

 final  List<DailyQuizItem> _quizzes;
@override List<DailyQuizItem> get quizzes {
  if (_quizzes is EqualUnmodifiableListView) return _quizzes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quizzes);
}

@override final  bool completed;

/// Create a copy of DailyQuizResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyQuizResponseCopyWith<_DailyQuizResponse> get copyWith => __$DailyQuizResponseCopyWithImpl<_DailyQuizResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyQuizResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyQuizResponse&&const DeepCollectionEquality().equals(other._quizzes, _quizzes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_quizzes),completed);

@override
String toString() {
  return 'DailyQuizResponse(quizzes: $quizzes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$DailyQuizResponseCopyWith<$Res> implements $DailyQuizResponseCopyWith<$Res> {
  factory _$DailyQuizResponseCopyWith(_DailyQuizResponse value, $Res Function(_DailyQuizResponse) _then) = __$DailyQuizResponseCopyWithImpl;
@override @useResult
$Res call({
 List<DailyQuizItem> quizzes, bool completed
});




}
/// @nodoc
class __$DailyQuizResponseCopyWithImpl<$Res>
    implements _$DailyQuizResponseCopyWith<$Res> {
  __$DailyQuizResponseCopyWithImpl(this._self, this._then);

  final _DailyQuizResponse _self;
  final $Res Function(_DailyQuizResponse) _then;

/// Create a copy of DailyQuizResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? quizzes = null,Object? completed = null,}) {
  return _then(_DailyQuizResponse(
quizzes: null == quizzes ? _self._quizzes : quizzes // ignore: cast_nullable_to_non_nullable
as List<DailyQuizItem>,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ApiErrorResponse {

 String get code; String get message; DateTime get timestamp;
/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiErrorResponseCopyWith<ApiErrorResponse> get copyWith => _$ApiErrorResponseCopyWithImpl<ApiErrorResponse>(this as ApiErrorResponse, _$identity);

  /// Serializes this ApiErrorResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiErrorResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp);

@override
String toString() {
  return 'ApiErrorResponse(code: $code, message: $message, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $ApiErrorResponseCopyWith<$Res>  {
  factory $ApiErrorResponseCopyWith(ApiErrorResponse value, $Res Function(ApiErrorResponse) _then) = _$ApiErrorResponseCopyWithImpl;
@useResult
$Res call({
 String code, String message, DateTime timestamp
});




}
/// @nodoc
class _$ApiErrorResponseCopyWithImpl<$Res>
    implements $ApiErrorResponseCopyWith<$Res> {
  _$ApiErrorResponseCopyWithImpl(this._self, this._then);

  final ApiErrorResponse _self;
  final $Res Function(ApiErrorResponse) _then;

/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? message = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ApiErrorResponse].
extension ApiErrorResponsePatterns on ApiErrorResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApiErrorResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApiErrorResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApiErrorResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApiErrorResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApiErrorResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApiErrorResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String message,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApiErrorResponse() when $default != null:
return $default(_that.code,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String message,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _ApiErrorResponse():
return $default(_that.code,_that.message,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String message,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _ApiErrorResponse() when $default != null:
return $default(_that.code,_that.message,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApiErrorResponse implements ApiErrorResponse {
  const _ApiErrorResponse({required this.code, required this.message, required this.timestamp});
  factory _ApiErrorResponse.fromJson(Map<String, dynamic> json) => _$ApiErrorResponseFromJson(json);

@override final  String code;
@override final  String message;
@override final  DateTime timestamp;

/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorResponseCopyWith<_ApiErrorResponse> get copyWith => __$ApiErrorResponseCopyWithImpl<_ApiErrorResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiErrorResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiErrorResponse&&(identical(other.code, code) || other.code == code)&&(identical(other.message, message) || other.message == message)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,message,timestamp);

@override
String toString() {
  return 'ApiErrorResponse(code: $code, message: $message, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorResponseCopyWith<$Res> implements $ApiErrorResponseCopyWith<$Res> {
  factory _$ApiErrorResponseCopyWith(_ApiErrorResponse value, $Res Function(_ApiErrorResponse) _then) = __$ApiErrorResponseCopyWithImpl;
@override @useResult
$Res call({
 String code, String message, DateTime timestamp
});




}
/// @nodoc
class __$ApiErrorResponseCopyWithImpl<$Res>
    implements _$ApiErrorResponseCopyWith<$Res> {
  __$ApiErrorResponseCopyWithImpl(this._self, this._then);

  final _ApiErrorResponse _self;
  final $Res Function(_ApiErrorResponse) _then;

/// Create a copy of ApiErrorResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? message = null,Object? timestamp = null,}) {
  return _then(_ApiErrorResponse(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
