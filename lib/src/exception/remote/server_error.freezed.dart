// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerError {

/// server-defined status code
 int? get generalServerStatusCode;/// server-defined error id
 String? get generalServerErrorId;/// server-defined message
 String? get generalMessage; List<ServerErrorDetail> get errors;
/// Create a copy of ServerError
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this as ServerError, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.generalServerStatusCode, generalServerStatusCode) || other.generalServerStatusCode == generalServerStatusCode)&&(identical(other.generalServerErrorId, generalServerErrorId) || other.generalServerErrorId == generalServerErrorId)&&(identical(other.generalMessage, generalMessage) || other.generalMessage == generalMessage)&&const DeepCollectionEquality().equals(other.errors, errors));
}


@override
int get hashCode => Object.hash(runtimeType,generalServerStatusCode,generalServerErrorId,generalMessage,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'ServerError(generalServerStatusCode: $generalServerStatusCode, generalServerErrorId: $generalServerErrorId, generalMessage: $generalMessage, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res>  {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@useResult
$Res call({
 int? generalServerStatusCode, String? generalServerErrorId, String? generalMessage, List<ServerErrorDetail> errors
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of ServerError
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? generalServerStatusCode = freezed,Object? generalServerErrorId = freezed,Object? generalMessage = freezed,Object? errors = null,}) {
  return _then(_self.copyWith(
generalServerStatusCode: freezed == generalServerStatusCode ? _self.generalServerStatusCode : generalServerStatusCode // ignore: cast_nullable_to_non_nullable
as int?,generalServerErrorId: freezed == generalServerErrorId ? _self.generalServerErrorId : generalServerErrorId // ignore: cast_nullable_to_non_nullable
as String?,generalMessage: freezed == generalMessage ? _self.generalMessage : generalMessage // ignore: cast_nullable_to_non_nullable
as String?,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as List<ServerErrorDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerError].
extension ServerErrorPatterns on ServerError {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerError value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerError() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerError value)  $default,){
final _that = this;
switch (_that) {
case _ServerError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerError value)?  $default,){
final _that = this;
switch (_that) {
case _ServerError() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? generalServerStatusCode,  String? generalServerErrorId,  String? generalMessage,  List<ServerErrorDetail> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerError() when $default != null:
return $default(_that.generalServerStatusCode,_that.generalServerErrorId,_that.generalMessage,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? generalServerStatusCode,  String? generalServerErrorId,  String? generalMessage,  List<ServerErrorDetail> errors)  $default,) {final _that = this;
switch (_that) {
case _ServerError():
return $default(_that.generalServerStatusCode,_that.generalServerErrorId,_that.generalMessage,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? generalServerStatusCode,  String? generalServerErrorId,  String? generalMessage,  List<ServerErrorDetail> errors)?  $default,) {final _that = this;
switch (_that) {
case _ServerError() when $default != null:
return $default(_that.generalServerStatusCode,_that.generalServerErrorId,_that.generalMessage,_that.errors);case _:
  return null;

}
}

}

/// @nodoc


class _ServerError extends ServerError {
  const _ServerError({this.generalServerStatusCode, this.generalServerErrorId, this.generalMessage, final  List<ServerErrorDetail> errors = ServerError.defaultErrors}): _errors = errors,super._();
  

/// server-defined status code
@override final  int? generalServerStatusCode;
/// server-defined error id
@override final  String? generalServerErrorId;
/// server-defined message
@override final  String? generalMessage;
 final  List<ServerErrorDetail> _errors;
@override@JsonKey() List<ServerErrorDetail> get errors {
  if (_errors is EqualUnmodifiableListView) return _errors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_errors);
}


/// Create a copy of ServerError
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorCopyWith<_ServerError> get copyWith => __$ServerErrorCopyWithImpl<_ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerError&&(identical(other.generalServerStatusCode, generalServerStatusCode) || other.generalServerStatusCode == generalServerStatusCode)&&(identical(other.generalServerErrorId, generalServerErrorId) || other.generalServerErrorId == generalServerErrorId)&&(identical(other.generalMessage, generalMessage) || other.generalMessage == generalMessage)&&const DeepCollectionEquality().equals(other._errors, _errors));
}


@override
int get hashCode => Object.hash(runtimeType,generalServerStatusCode,generalServerErrorId,generalMessage,const DeepCollectionEquality().hash(_errors));

@override
String toString() {
  return 'ServerError(generalServerStatusCode: $generalServerStatusCode, generalServerErrorId: $generalServerErrorId, generalMessage: $generalMessage, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorCopyWith<$Res> implements $ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(_ServerError value, $Res Function(_ServerError) _then) = __$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 int? generalServerStatusCode, String? generalServerErrorId, String? generalMessage, List<ServerErrorDetail> errors
});




}
/// @nodoc
class __$ServerErrorCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(this._self, this._then);

  final _ServerError _self;
  final $Res Function(_ServerError) _then;

/// Create a copy of ServerError
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? generalServerStatusCode = freezed,Object? generalServerErrorId = freezed,Object? generalMessage = freezed,Object? errors = null,}) {
  return _then(_ServerError(
generalServerStatusCode: freezed == generalServerStatusCode ? _self.generalServerStatusCode : generalServerStatusCode // ignore: cast_nullable_to_non_nullable
as int?,generalServerErrorId: freezed == generalServerErrorId ? _self.generalServerErrorId : generalServerErrorId // ignore: cast_nullable_to_non_nullable
as String?,generalMessage: freezed == generalMessage ? _self.generalMessage : generalMessage // ignore: cast_nullable_to_non_nullable
as String?,errors: null == errors ? _self._errors : errors // ignore: cast_nullable_to_non_nullable
as List<ServerErrorDetail>,
  ));
}


}

// dart format on
