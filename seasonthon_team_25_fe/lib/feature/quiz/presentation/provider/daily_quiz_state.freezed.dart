// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_quiz_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DailyQuizState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyQuizState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyQuizState()';
}


}

/// @nodoc
class $DailyQuizStateCopyWith<$Res>  {
$DailyQuizStateCopyWith(DailyQuizState _, $Res Function(DailyQuizState) __);
}


/// Adds pattern-matching-related methods to [DailyQuizState].
extension DailyQuizStatePatterns on DailyQuizState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _FirstVisitToday value)?  firstVisitToday,TResult Function( _ResumeInProgress value)?  resumeInProgress,TResult Function( _HasWrong value)?  hasWrong,TResult Function( _Completed value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _FirstVisitToday() when firstVisitToday != null:
return firstVisitToday(_that);case _ResumeInProgress() when resumeInProgress != null:
return resumeInProgress(_that);case _HasWrong() when hasWrong != null:
return hasWrong(_that);case _Completed() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _FirstVisitToday value)  firstVisitToday,required TResult Function( _ResumeInProgress value)  resumeInProgress,required TResult Function( _HasWrong value)  hasWrong,required TResult Function( _Completed value)  completed,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Error():
return error(_that);case _FirstVisitToday():
return firstVisitToday(_that);case _ResumeInProgress():
return resumeInProgress(_that);case _HasWrong():
return hasWrong(_that);case _Completed():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _FirstVisitToday value)?  firstVisitToday,TResult? Function( _ResumeInProgress value)?  resumeInProgress,TResult? Function( _HasWrong value)?  hasWrong,TResult? Function( _Completed value)?  completed,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _FirstVisitToday() when firstVisitToday != null:
return firstVisitToday(_that);case _ResumeInProgress() when resumeInProgress != null:
return resumeInProgress(_that);case _HasWrong() when hasWrong != null:
return hasWrong(_that);case _Completed() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( DailyQuizEntity data,  int remainingCount)?  firstVisitToday,TResult Function( DailyQuizEntity data,  int remainingCount)?  resumeInProgress,TResult Function( DailyQuizEntity data,  int remainingCount)?  hasWrong,TResult Function( DailyQuizEntity data)?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _FirstVisitToday() when firstVisitToday != null:
return firstVisitToday(_that.data,_that.remainingCount);case _ResumeInProgress() when resumeInProgress != null:
return resumeInProgress(_that.data,_that.remainingCount);case _HasWrong() when hasWrong != null:
return hasWrong(_that.data,_that.remainingCount);case _Completed() when completed != null:
return completed(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( DailyQuizEntity data,  int remainingCount)  firstVisitToday,required TResult Function( DailyQuizEntity data,  int remainingCount)  resumeInProgress,required TResult Function( DailyQuizEntity data,  int remainingCount)  hasWrong,required TResult Function( DailyQuizEntity data)  completed,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Error():
return error(_that.message);case _FirstVisitToday():
return firstVisitToday(_that.data,_that.remainingCount);case _ResumeInProgress():
return resumeInProgress(_that.data,_that.remainingCount);case _HasWrong():
return hasWrong(_that.data,_that.remainingCount);case _Completed():
return completed(_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( DailyQuizEntity data,  int remainingCount)?  firstVisitToday,TResult? Function( DailyQuizEntity data,  int remainingCount)?  resumeInProgress,TResult? Function( DailyQuizEntity data,  int remainingCount)?  hasWrong,TResult? Function( DailyQuizEntity data)?  completed,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _FirstVisitToday() when firstVisitToday != null:
return firstVisitToday(_that.data,_that.remainingCount);case _ResumeInProgress() when resumeInProgress != null:
return resumeInProgress(_that.data,_that.remainingCount);case _HasWrong() when hasWrong != null:
return hasWrong(_that.data,_that.remainingCount);case _Completed() when completed != null:
return completed(_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements DailyQuizState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DailyQuizState.loading()';
}


}




/// @nodoc


class _Error implements DailyQuizState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'DailyQuizState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $DailyQuizStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _FirstVisitToday implements DailyQuizState {
  const _FirstVisitToday({required this.data, required this.remainingCount});
  

 final  DailyQuizEntity data;
 final  int remainingCount;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirstVisitTodayCopyWith<_FirstVisitToday> get copyWith => __$FirstVisitTodayCopyWithImpl<_FirstVisitToday>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirstVisitToday&&(identical(other.data, data) || other.data == data)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount));
}


@override
int get hashCode => Object.hash(runtimeType,data,remainingCount);

@override
String toString() {
  return 'DailyQuizState.firstVisitToday(data: $data, remainingCount: $remainingCount)';
}


}

/// @nodoc
abstract mixin class _$FirstVisitTodayCopyWith<$Res> implements $DailyQuizStateCopyWith<$Res> {
  factory _$FirstVisitTodayCopyWith(_FirstVisitToday value, $Res Function(_FirstVisitToday) _then) = __$FirstVisitTodayCopyWithImpl;
@useResult
$Res call({
 DailyQuizEntity data, int remainingCount
});




}
/// @nodoc
class __$FirstVisitTodayCopyWithImpl<$Res>
    implements _$FirstVisitTodayCopyWith<$Res> {
  __$FirstVisitTodayCopyWithImpl(this._self, this._then);

  final _FirstVisitToday _self;
  final $Res Function(_FirstVisitToday) _then;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? remainingCount = null,}) {
  return _then(_FirstVisitToday(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DailyQuizEntity,remainingCount: null == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ResumeInProgress implements DailyQuizState {
  const _ResumeInProgress({required this.data, required this.remainingCount});
  

 final  DailyQuizEntity data;
 final  int remainingCount;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResumeInProgressCopyWith<_ResumeInProgress> get copyWith => __$ResumeInProgressCopyWithImpl<_ResumeInProgress>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeInProgress&&(identical(other.data, data) || other.data == data)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount));
}


@override
int get hashCode => Object.hash(runtimeType,data,remainingCount);

@override
String toString() {
  return 'DailyQuizState.resumeInProgress(data: $data, remainingCount: $remainingCount)';
}


}

/// @nodoc
abstract mixin class _$ResumeInProgressCopyWith<$Res> implements $DailyQuizStateCopyWith<$Res> {
  factory _$ResumeInProgressCopyWith(_ResumeInProgress value, $Res Function(_ResumeInProgress) _then) = __$ResumeInProgressCopyWithImpl;
@useResult
$Res call({
 DailyQuizEntity data, int remainingCount
});




}
/// @nodoc
class __$ResumeInProgressCopyWithImpl<$Res>
    implements _$ResumeInProgressCopyWith<$Res> {
  __$ResumeInProgressCopyWithImpl(this._self, this._then);

  final _ResumeInProgress _self;
  final $Res Function(_ResumeInProgress) _then;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? remainingCount = null,}) {
  return _then(_ResumeInProgress(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DailyQuizEntity,remainingCount: null == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _HasWrong implements DailyQuizState {
  const _HasWrong({required this.data, required this.remainingCount});
  

 final  DailyQuizEntity data;
 final  int remainingCount;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HasWrongCopyWith<_HasWrong> get copyWith => __$HasWrongCopyWithImpl<_HasWrong>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HasWrong&&(identical(other.data, data) || other.data == data)&&(identical(other.remainingCount, remainingCount) || other.remainingCount == remainingCount));
}


@override
int get hashCode => Object.hash(runtimeType,data,remainingCount);

@override
String toString() {
  return 'DailyQuizState.hasWrong(data: $data, remainingCount: $remainingCount)';
}


}

/// @nodoc
abstract mixin class _$HasWrongCopyWith<$Res> implements $DailyQuizStateCopyWith<$Res> {
  factory _$HasWrongCopyWith(_HasWrong value, $Res Function(_HasWrong) _then) = __$HasWrongCopyWithImpl;
@useResult
$Res call({
 DailyQuizEntity data, int remainingCount
});




}
/// @nodoc
class __$HasWrongCopyWithImpl<$Res>
    implements _$HasWrongCopyWith<$Res> {
  __$HasWrongCopyWithImpl(this._self, this._then);

  final _HasWrong _self;
  final $Res Function(_HasWrong) _then;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? remainingCount = null,}) {
  return _then(_HasWrong(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DailyQuizEntity,remainingCount: null == remainingCount ? _self.remainingCount : remainingCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _Completed implements DailyQuizState {
  const _Completed({required this.data});
  

 final  DailyQuizEntity data;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CompletedCopyWith<_Completed> get copyWith => __$CompletedCopyWithImpl<_Completed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Completed&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'DailyQuizState.completed(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CompletedCopyWith<$Res> implements $DailyQuizStateCopyWith<$Res> {
  factory _$CompletedCopyWith(_Completed value, $Res Function(_Completed) _then) = __$CompletedCopyWithImpl;
@useResult
$Res call({
 DailyQuizEntity data
});




}
/// @nodoc
class __$CompletedCopyWithImpl<$Res>
    implements _$CompletedCopyWith<$Res> {
  __$CompletedCopyWithImpl(this._self, this._then);

  final _Completed _self;
  final $Res Function(_Completed) _then;

/// Create a copy of DailyQuizState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_Completed(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DailyQuizEntity,
  ));
}


}

// dart format on
