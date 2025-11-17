// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_error_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerErrorDetail {

 String? get detail; String? get path;/// server-defined error code
 String? get serverErrorId;/// server-defined status code
 int? get serverStatusCode;/// server-defined message
 String? get message;/// server-defined field
 String? get field;
/// Create a copy of ServerErrorDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorDetailCopyWith<ServerErrorDetail> get copyWith => _$ServerErrorDetailCopyWithImpl<ServerErrorDetail>(this as ServerErrorDetail, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerErrorDetail&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.path, path) || other.path == path)&&(identical(other.serverErrorId, serverErrorId) || other.serverErrorId == serverErrorId)&&(identical(other.serverStatusCode, serverStatusCode) || other.serverStatusCode == serverStatusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode => Object.hash(runtimeType,detail,path,serverErrorId,serverStatusCode,message,field);

@override
String toString() {
  return 'ServerErrorDetail(detail: $detail, path: $path, serverErrorId: $serverErrorId, serverStatusCode: $serverStatusCode, message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class $ServerErrorDetailCopyWith<$Res>  {
  factory $ServerErrorDetailCopyWith(ServerErrorDetail value, $Res Function(ServerErrorDetail) _then) = _$ServerErrorDetailCopyWithImpl;
@useResult
$Res call({
 String? detail, String? path, String? serverErrorId, int? serverStatusCode, String? message, String? field
});




}
/// @nodoc
class _$ServerErrorDetailCopyWithImpl<$Res>
    implements $ServerErrorDetailCopyWith<$Res> {
  _$ServerErrorDetailCopyWithImpl(this._self, this._then);

  final ServerErrorDetail _self;
  final $Res Function(ServerErrorDetail) _then;

/// Create a copy of ServerErrorDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? detail = freezed,Object? path = freezed,Object? serverErrorId = freezed,Object? serverStatusCode = freezed,Object? message = freezed,Object? field = freezed,}) {
  return _then(_self.copyWith(
detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,serverErrorId: freezed == serverErrorId ? _self.serverErrorId : serverErrorId // ignore: cast_nullable_to_non_nullable
as String?,serverStatusCode: freezed == serverStatusCode ? _self.serverStatusCode : serverStatusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerErrorDetail].
extension ServerErrorDetailPatterns on ServerErrorDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerErrorDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerErrorDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerErrorDetail value)  $default,){
final _that = this;
switch (_that) {
case _ServerErrorDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerErrorDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ServerErrorDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? detail,  String? path,  String? serverErrorId,  int? serverStatusCode,  String? message,  String? field)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerErrorDetail() when $default != null:
return $default(_that.detail,_that.path,_that.serverErrorId,_that.serverStatusCode,_that.message,_that.field);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? detail,  String? path,  String? serverErrorId,  int? serverStatusCode,  String? message,  String? field)  $default,) {final _that = this;
switch (_that) {
case _ServerErrorDetail():
return $default(_that.detail,_that.path,_that.serverErrorId,_that.serverStatusCode,_that.message,_that.field);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? detail,  String? path,  String? serverErrorId,  int? serverStatusCode,  String? message,  String? field)?  $default,) {final _that = this;
switch (_that) {
case _ServerErrorDetail() when $default != null:
return $default(_that.detail,_that.path,_that.serverErrorId,_that.serverStatusCode,_that.message,_that.field);case _:
  return null;

}
}

}

/// @nodoc


class _ServerErrorDetail implements ServerErrorDetail {
  const _ServerErrorDetail({this.detail, this.path, this.serverErrorId, this.serverStatusCode, this.message, this.field});
  

@override final  String? detail;
@override final  String? path;
/// server-defined error code
@override final  String? serverErrorId;
/// server-defined status code
@override final  int? serverStatusCode;
/// server-defined message
@override final  String? message;
/// server-defined field
@override final  String? field;

/// Create a copy of ServerErrorDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerErrorDetailCopyWith<_ServerErrorDetail> get copyWith => __$ServerErrorDetailCopyWithImpl<_ServerErrorDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerErrorDetail&&(identical(other.detail, detail) || other.detail == detail)&&(identical(other.path, path) || other.path == path)&&(identical(other.serverErrorId, serverErrorId) || other.serverErrorId == serverErrorId)&&(identical(other.serverStatusCode, serverStatusCode) || other.serverStatusCode == serverStatusCode)&&(identical(other.message, message) || other.message == message)&&(identical(other.field, field) || other.field == field));
}


@override
int get hashCode => Object.hash(runtimeType,detail,path,serverErrorId,serverStatusCode,message,field);

@override
String toString() {
  return 'ServerErrorDetail(detail: $detail, path: $path, serverErrorId: $serverErrorId, serverStatusCode: $serverStatusCode, message: $message, field: $field)';
}


}

/// @nodoc
abstract mixin class _$ServerErrorDetailCopyWith<$Res> implements $ServerErrorDetailCopyWith<$Res> {
  factory _$ServerErrorDetailCopyWith(_ServerErrorDetail value, $Res Function(_ServerErrorDetail) _then) = __$ServerErrorDetailCopyWithImpl;
@override @useResult
$Res call({
 String? detail, String? path, String? serverErrorId, int? serverStatusCode, String? message, String? field
});




}
/// @nodoc
class __$ServerErrorDetailCopyWithImpl<$Res>
    implements _$ServerErrorDetailCopyWith<$Res> {
  __$ServerErrorDetailCopyWithImpl(this._self, this._then);

  final _ServerErrorDetail _self;
  final $Res Function(_ServerErrorDetail) _then;

/// Create a copy of ServerErrorDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? detail = freezed,Object? path = freezed,Object? serverErrorId = freezed,Object? serverStatusCode = freezed,Object? message = freezed,Object? field = freezed,}) {
  return _then(_ServerErrorDetail(
detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,serverErrorId: freezed == serverErrorId ? _self.serverErrorId : serverErrorId // ignore: cast_nullable_to_non_nullable
as String?,serverStatusCode: freezed == serverStatusCode ? _self.serverStatusCode : serverStatusCode // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
