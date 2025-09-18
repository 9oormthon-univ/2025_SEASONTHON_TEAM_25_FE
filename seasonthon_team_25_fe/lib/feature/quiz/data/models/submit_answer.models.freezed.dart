// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_answer.models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitAnswerRequest {

 int get userQuizId; String get userAnswer;
/// Create a copy of SubmitAnswerRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitAnswerRequestCopyWith<SubmitAnswerRequest> get copyWith => _$SubmitAnswerRequestCopyWithImpl<SubmitAnswerRequest>(this as SubmitAnswerRequest, _$identity);

  /// Serializes this SubmitAnswerRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitAnswerRequest&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,userAnswer);

@override
String toString() {
  return 'SubmitAnswerRequest(userQuizId: $userQuizId, userAnswer: $userAnswer)';
}


}

/// @nodoc
abstract mixin class $SubmitAnswerRequestCopyWith<$Res>  {
  factory $SubmitAnswerRequestCopyWith(SubmitAnswerRequest value, $Res Function(SubmitAnswerRequest) _then) = _$SubmitAnswerRequestCopyWithImpl;
@useResult
$Res call({
 int userQuizId, String userAnswer
});




}
/// @nodoc
class _$SubmitAnswerRequestCopyWithImpl<$Res>
    implements $SubmitAnswerRequestCopyWith<$Res> {
  _$SubmitAnswerRequestCopyWithImpl(this._self, this._then);

  final SubmitAnswerRequest _self;
  final $Res Function(SubmitAnswerRequest) _then;

/// Create a copy of SubmitAnswerRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userQuizId = null,Object? userAnswer = null,}) {
  return _then(_self.copyWith(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitAnswerRequest].
extension SubmitAnswerRequestPatterns on SubmitAnswerRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitAnswerRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitAnswerRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitAnswerRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitAnswerRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitAnswerRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitAnswerRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int userQuizId,  String userAnswer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitAnswerRequest() when $default != null:
return $default(_that.userQuizId,_that.userAnswer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int userQuizId,  String userAnswer)  $default,) {final _that = this;
switch (_that) {
case _SubmitAnswerRequest():
return $default(_that.userQuizId,_that.userAnswer);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int userQuizId,  String userAnswer)?  $default,) {final _that = this;
switch (_that) {
case _SubmitAnswerRequest() when $default != null:
return $default(_that.userQuizId,_that.userAnswer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitAnswerRequest implements SubmitAnswerRequest {
  const _SubmitAnswerRequest({required this.userQuizId, required this.userAnswer});
  factory _SubmitAnswerRequest.fromJson(Map<String, dynamic> json) => _$SubmitAnswerRequestFromJson(json);

@override final  int userQuizId;
@override final  String userAnswer;

/// Create a copy of SubmitAnswerRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitAnswerRequestCopyWith<_SubmitAnswerRequest> get copyWith => __$SubmitAnswerRequestCopyWithImpl<_SubmitAnswerRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitAnswerRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitAnswerRequest&&(identical(other.userQuizId, userQuizId) || other.userQuizId == userQuizId)&&(identical(other.userAnswer, userAnswer) || other.userAnswer == userAnswer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userQuizId,userAnswer);

@override
String toString() {
  return 'SubmitAnswerRequest(userQuizId: $userQuizId, userAnswer: $userAnswer)';
}


}

/// @nodoc
abstract mixin class _$SubmitAnswerRequestCopyWith<$Res> implements $SubmitAnswerRequestCopyWith<$Res> {
  factory _$SubmitAnswerRequestCopyWith(_SubmitAnswerRequest value, $Res Function(_SubmitAnswerRequest) _then) = __$SubmitAnswerRequestCopyWithImpl;
@override @useResult
$Res call({
 int userQuizId, String userAnswer
});




}
/// @nodoc
class __$SubmitAnswerRequestCopyWithImpl<$Res>
    implements _$SubmitAnswerRequestCopyWith<$Res> {
  __$SubmitAnswerRequestCopyWithImpl(this._self, this._then);

  final _SubmitAnswerRequest _self;
  final $Res Function(_SubmitAnswerRequest) _then;

/// Create a copy of SubmitAnswerRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userQuizId = null,Object? userAnswer = null,}) {
  return _then(_SubmitAnswerRequest(
userQuizId: null == userQuizId ? _self.userQuizId : userQuizId // ignore: cast_nullable_to_non_nullable
as int,userAnswer: null == userAnswer ? _self.userAnswer : userAnswer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SubmitAnswerResponse {

 String get explanation; String get category;// "news" or "quiz"
 String get hint;// newsId or hint string
 String get correctAnswer;// "true"/"false" or "1".."4"
 bool get correct;
/// Create a copy of SubmitAnswerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitAnswerResponseCopyWith<SubmitAnswerResponse> get copyWith => _$SubmitAnswerResponseCopyWithImpl<SubmitAnswerResponse>(this as SubmitAnswerResponse, _$identity);

  /// Serializes this SubmitAnswerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitAnswerResponse&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.category, category) || other.category == category)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.correct, correct) || other.correct == correct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,explanation,category,hint,correctAnswer,correct);

@override
String toString() {
  return 'SubmitAnswerResponse(explanation: $explanation, category: $category, hint: $hint, correctAnswer: $correctAnswer, correct: $correct)';
}


}

/// @nodoc
abstract mixin class $SubmitAnswerResponseCopyWith<$Res>  {
  factory $SubmitAnswerResponseCopyWith(SubmitAnswerResponse value, $Res Function(SubmitAnswerResponse) _then) = _$SubmitAnswerResponseCopyWithImpl;
@useResult
$Res call({
 String explanation, String category, String hint, String correctAnswer, bool correct
});




}
/// @nodoc
class _$SubmitAnswerResponseCopyWithImpl<$Res>
    implements $SubmitAnswerResponseCopyWith<$Res> {
  _$SubmitAnswerResponseCopyWithImpl(this._self, this._then);

  final SubmitAnswerResponse _self;
  final $Res Function(SubmitAnswerResponse) _then;

/// Create a copy of SubmitAnswerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? explanation = null,Object? category = null,Object? hint = null,Object? correctAnswer = null,Object? correct = null,}) {
  return _then(_self.copyWith(
explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitAnswerResponse].
extension SubmitAnswerResponsePatterns on SubmitAnswerResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitAnswerResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitAnswerResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitAnswerResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubmitAnswerResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitAnswerResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitAnswerResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String explanation,  String category,  String hint,  String correctAnswer,  bool correct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitAnswerResponse() when $default != null:
return $default(_that.explanation,_that.category,_that.hint,_that.correctAnswer,_that.correct);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String explanation,  String category,  String hint,  String correctAnswer,  bool correct)  $default,) {final _that = this;
switch (_that) {
case _SubmitAnswerResponse():
return $default(_that.explanation,_that.category,_that.hint,_that.correctAnswer,_that.correct);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String explanation,  String category,  String hint,  String correctAnswer,  bool correct)?  $default,) {final _that = this;
switch (_that) {
case _SubmitAnswerResponse() when $default != null:
return $default(_that.explanation,_that.category,_that.hint,_that.correctAnswer,_that.correct);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitAnswerResponse implements SubmitAnswerResponse {
  const _SubmitAnswerResponse({required this.explanation, required this.category, required this.hint, required this.correctAnswer, required this.correct});
  factory _SubmitAnswerResponse.fromJson(Map<String, dynamic> json) => _$SubmitAnswerResponseFromJson(json);

@override final  String explanation;
@override final  String category;
// "news" or "quiz"
@override final  String hint;
// newsId or hint string
@override final  String correctAnswer;
// "true"/"false" or "1".."4"
@override final  bool correct;

/// Create a copy of SubmitAnswerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitAnswerResponseCopyWith<_SubmitAnswerResponse> get copyWith => __$SubmitAnswerResponseCopyWithImpl<_SubmitAnswerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitAnswerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitAnswerResponse&&(identical(other.explanation, explanation) || other.explanation == explanation)&&(identical(other.category, category) || other.category == category)&&(identical(other.hint, hint) || other.hint == hint)&&(identical(other.correctAnswer, correctAnswer) || other.correctAnswer == correctAnswer)&&(identical(other.correct, correct) || other.correct == correct));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,explanation,category,hint,correctAnswer,correct);

@override
String toString() {
  return 'SubmitAnswerResponse(explanation: $explanation, category: $category, hint: $hint, correctAnswer: $correctAnswer, correct: $correct)';
}


}

/// @nodoc
abstract mixin class _$SubmitAnswerResponseCopyWith<$Res> implements $SubmitAnswerResponseCopyWith<$Res> {
  factory _$SubmitAnswerResponseCopyWith(_SubmitAnswerResponse value, $Res Function(_SubmitAnswerResponse) _then) = __$SubmitAnswerResponseCopyWithImpl;
@override @useResult
$Res call({
 String explanation, String category, String hint, String correctAnswer, bool correct
});




}
/// @nodoc
class __$SubmitAnswerResponseCopyWithImpl<$Res>
    implements _$SubmitAnswerResponseCopyWith<$Res> {
  __$SubmitAnswerResponseCopyWithImpl(this._self, this._then);

  final _SubmitAnswerResponse _self;
  final $Res Function(_SubmitAnswerResponse) _then;

/// Create a copy of SubmitAnswerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? explanation = null,Object? category = null,Object? hint = null,Object? correctAnswer = null,Object? correct = null,}) {
  return _then(_SubmitAnswerResponse(
explanation: null == explanation ? _self.explanation : explanation // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,hint: null == hint ? _self.hint : hint // ignore: cast_nullable_to_non_nullable
as String,correctAnswer: null == correctAnswer ? _self.correctAnswer : correctAnswer // ignore: cast_nullable_to_non_nullable
as String,correct: null == correct ? _self.correct : correct // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
