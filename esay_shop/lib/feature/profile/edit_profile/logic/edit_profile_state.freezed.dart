// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditProfileState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EditProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditProfileState()';
}


}

/// @nodoc
class $EditProfileStateCopyWith<$Res>  {
$EditProfileStateCopyWith(EditProfileState _, $Res Function(EditProfileState) __);
}


/// Adds pattern-matching-related methods to [EditProfileState].
extension EditProfileStatePatterns on EditProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _LocationLoading value)?  locationLoading,TResult Function( _LocationSuccess value)?  locationSuccess,TResult Function( _LocationFailure value)?  locationFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _LocationLoading() when locationLoading != null:
return locationLoading(_that);case _LocationSuccess() when locationSuccess != null:
return locationSuccess(_that);case _LocationFailure() when locationFailure != null:
return locationFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _LocationLoading value)  locationLoading,required TResult Function( _LocationSuccess value)  locationSuccess,required TResult Function( _LocationFailure value)  locationFailure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _LocationLoading():
return locationLoading(_that);case _LocationSuccess():
return locationSuccess(_that);case _LocationFailure():
return locationFailure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _LocationLoading value)?  locationLoading,TResult? Function( _LocationSuccess value)?  locationSuccess,TResult? Function( _LocationFailure value)?  locationFailure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _LocationLoading() when locationLoading != null:
return locationLoading(_that);case _LocationSuccess() when locationSuccess != null:
return locationSuccess(_that);case _LocationFailure() when locationFailure != null:
return locationFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String? message)?  success,TResult Function( String message)?  failure,TResult Function()?  locationLoading,TResult Function( String address)?  locationSuccess,TResult Function( String error)?  locationFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.message);case _Failure() when failure != null:
return failure(_that.message);case _LocationLoading() when locationLoading != null:
return locationLoading();case _LocationSuccess() when locationSuccess != null:
return locationSuccess(_that.address);case _LocationFailure() when locationFailure != null:
return locationFailure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String? message)  success,required TResult Function( String message)  failure,required TResult Function()  locationLoading,required TResult Function( String address)  locationSuccess,required TResult Function( String error)  locationFailure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.message);case _Failure():
return failure(_that.message);case _LocationLoading():
return locationLoading();case _LocationSuccess():
return locationSuccess(_that.address);case _LocationFailure():
return locationFailure(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String? message)?  success,TResult? Function( String message)?  failure,TResult? Function()?  locationLoading,TResult? Function( String address)?  locationSuccess,TResult? Function( String error)?  locationFailure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.message);case _Failure() when failure != null:
return failure(_that.message);case _LocationLoading() when locationLoading != null:
return locationLoading();case _LocationSuccess() when locationSuccess != null:
return locationSuccess(_that.address);case _LocationFailure() when locationFailure != null:
return locationFailure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements EditProfileState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditProfileState.initial()';
}


}




/// @nodoc


class _Loading implements EditProfileState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditProfileState.loading()';
}


}




/// @nodoc


class _Success implements EditProfileState {
  const _Success({this.message});
  

 final  String? message;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'EditProfileState.success(message: $message)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Success(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Failure implements EditProfileState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'EditProfileState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LocationLoading implements EditProfileState {
  const _LocationLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EditProfileState.locationLoading()';
}


}




/// @nodoc


class _LocationSuccess implements EditProfileState {
  const _LocationSuccess(this.address);
  

 final  String address;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationSuccessCopyWith<_LocationSuccess> get copyWith => __$LocationSuccessCopyWithImpl<_LocationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationSuccess&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode {
    return Object.hash(runtimeType,address);
}

@override
String toString() {
    return 'EditProfileState.locationSuccess(address: $address)';
}


}

/// @nodoc
abstract mixin class _$LocationSuccessCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$LocationSuccessCopyWith(_LocationSuccess value, $Res Function(_LocationSuccess) _then) = __$LocationSuccessCopyWithImpl;
@useResult
$Res call({
 String address
});




}
/// @nodoc
class __$LocationSuccessCopyWithImpl<$Res>
    implements _$LocationSuccessCopyWith<$Res> {
  __$LocationSuccessCopyWithImpl(this._self, this._then);

  final _LocationSuccess _self;
  final $Res Function(_LocationSuccess) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_LocationSuccess(
null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _LocationFailure implements EditProfileState {
  const _LocationFailure(this.error);
  

 final  String error;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationFailureCopyWith<_LocationFailure> get copyWith => __$LocationFailureCopyWithImpl<_LocationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'EditProfileState.locationFailure(error: $error)';
}


}

/// @nodoc
abstract mixin class _$LocationFailureCopyWith<$Res> implements $EditProfileStateCopyWith<$Res> {
  factory _$LocationFailureCopyWith(_LocationFailure value, $Res Function(_LocationFailure) _then) = __$LocationFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$LocationFailureCopyWithImpl<$Res>
    implements _$LocationFailureCopyWith<$Res> {
  __$LocationFailureCopyWithImpl(this._self, this._then);

  final _LocationFailure _self;
  final $Res Function(_LocationFailure) _then;

/// Create a copy of EditProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_LocationFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
