// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CheckoutState()';
}


}

/// @nodoc
class $CheckoutStateCopyWith<$Res>  {
$CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _LocationLoading value)?  locationLoading,TResult Function( _LocationUpdated value)?  locationUpdated,TResult Function( _Success value)?  success,TResult Function( _Failure value)?  failure,TResult Function( _PaymentMethodChanged value)?  paymentMethodChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LocationLoading() when locationLoading != null:
return locationLoading(_that);case _LocationUpdated() when locationUpdated != null:
return locationUpdated(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _LocationLoading value)  locationLoading,required TResult Function( _LocationUpdated value)  locationUpdated,required TResult Function( _Success value)  success,required TResult Function( _Failure value)  failure,required TResult Function( _PaymentMethodChanged value)  paymentMethodChanged,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _LocationLoading():
return locationLoading(_that);case _LocationUpdated():
return locationUpdated(_that);case _Success():
return success(_that);case _Failure():
return failure(_that);case _PaymentMethodChanged():
return paymentMethodChanged(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _LocationLoading value)?  locationLoading,TResult? Function( _LocationUpdated value)?  locationUpdated,TResult? Function( _Success value)?  success,TResult? Function( _Failure value)?  failure,TResult? Function( _PaymentMethodChanged value)?  paymentMethodChanged,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _LocationLoading() when locationLoading != null:
return locationLoading(_that);case _LocationUpdated() when locationUpdated != null:
return locationUpdated(_that);case _Success() when success != null:
return success(_that);case _Failure() when failure != null:
return failure(_that);case _PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  locationLoading,TResult Function( String address)?  locationUpdated,TResult Function( CheckoutModel checkout)?  success,TResult Function( String message)?  failure,TResult Function( String paymentMethod)?  paymentMethodChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LocationLoading() when locationLoading != null:
return locationLoading();case _LocationUpdated() when locationUpdated != null:
return locationUpdated(_that.address);case _Success() when success != null:
return success(_that.checkout);case _Failure() when failure != null:
return failure(_that.message);case _PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  locationLoading,required TResult Function( String address)  locationUpdated,required TResult Function( CheckoutModel checkout)  success,required TResult Function( String message)  failure,required TResult Function( String paymentMethod)  paymentMethodChanged,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _LocationLoading():
return locationLoading();case _LocationUpdated():
return locationUpdated(_that.address);case _Success():
return success(_that.checkout);case _Failure():
return failure(_that.message);case _PaymentMethodChanged():
return paymentMethodChanged(_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  locationLoading,TResult? Function( String address)?  locationUpdated,TResult? Function( CheckoutModel checkout)?  success,TResult? Function( String message)?  failure,TResult? Function( String paymentMethod)?  paymentMethodChanged,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _LocationLoading() when locationLoading != null:
return locationLoading();case _LocationUpdated() when locationUpdated != null:
return locationUpdated(_that.address);case _Success() when success != null:
return success(_that.checkout);case _Failure() when failure != null:
return failure(_that.message);case _PaymentMethodChanged() when paymentMethodChanged != null:
return paymentMethodChanged(_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CheckoutState {
  const _Initial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CheckoutState.initial()';
}


}




/// @nodoc


class _Loading implements CheckoutState {
  const _Loading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CheckoutState.loading()';
}


}




/// @nodoc


class _LocationLoading implements CheckoutState {
  const _LocationLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CheckoutState.locationLoading()';
}


}




/// @nodoc


class _LocationUpdated implements CheckoutState {
  const _LocationUpdated(this.address);
  

 final  String address;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationUpdatedCopyWith<_LocationUpdated> get copyWith => __$LocationUpdatedCopyWithImpl<_LocationUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationUpdated&&(identical(other.address, address) || other.address == address));
}


@override
int get hashCode {
    return Object.hash(runtimeType,address);
}

@override
String toString() {
    return 'CheckoutState.locationUpdated(address: $address)';
}


}

/// @nodoc
abstract mixin class _$LocationUpdatedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$LocationUpdatedCopyWith(_LocationUpdated value, $Res Function(_LocationUpdated) _then) = __$LocationUpdatedCopyWithImpl;
@useResult
$Res call({
 String address
});




}
/// @nodoc
class __$LocationUpdatedCopyWithImpl<$Res>
    implements _$LocationUpdatedCopyWith<$Res> {
  __$LocationUpdatedCopyWithImpl(this._self, this._then);

  final _LocationUpdated _self;
  final $Res Function(_LocationUpdated) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_LocationUpdated(
null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success implements CheckoutState {
  const _Success(this.checkout);
  

 final  CheckoutModel checkout;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.checkout, checkout) || other.checkout == checkout));
}


@override
int get hashCode {
    return Object.hash(runtimeType,checkout);
}

@override
String toString() {
    return 'CheckoutState.success(checkout: $checkout)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 CheckoutModel checkout
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkout = null,}) {
  return _then(_Success(
null == checkout ? _self.checkout : checkout // ignore: cast_nullable_to_non_nullable
as CheckoutModel,
  ));
}


}

/// @nodoc


class _Failure implements CheckoutState {
  const _Failure(this.message);
  

 final  String message;

/// Create a copy of CheckoutState
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
    return 'CheckoutState.failure(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
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

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Failure(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PaymentMethodChanged implements CheckoutState {
  const _PaymentMethodChanged(this.paymentMethod);
  

 final  String paymentMethod;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodChangedCopyWith<_PaymentMethodChanged> get copyWith => __$PaymentMethodChangedCopyWithImpl<_PaymentMethodChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodChanged&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}


@override
int get hashCode {
    return Object.hash(runtimeType,paymentMethod);
}

@override
String toString() {
    return 'CheckoutState.paymentMethodChanged(paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodChangedCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$PaymentMethodChangedCopyWith(_PaymentMethodChanged value, $Res Function(_PaymentMethodChanged) _then) = __$PaymentMethodChangedCopyWithImpl;
@useResult
$Res call({
 String paymentMethod
});




}
/// @nodoc
class __$PaymentMethodChangedCopyWithImpl<$Res>
    implements _$PaymentMethodChangedCopyWith<$Res> {
  __$PaymentMethodChangedCopyWithImpl(this._self, this._then);

  final _PaymentMethodChanged _self;
  final $Res Function(_PaymentMethodChanged) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,}) {
  return _then(_PaymentMethodChanged(
null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
