// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_popup_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppPopupInfo {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppPopupInfo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppPopupInfo()';
}


}

/// @nodoc
class $AppPopupInfoCopyWith<$Res>  {
$AppPopupInfoCopyWith(AppPopupInfo _, $Res Function(AppPopupInfo) __);
}


/// Adds pattern-matching-related methods to [AppPopupInfo].
extension AppPopupInfoPatterns on AppPopupInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ConfirmDialog value)?  confirmDialog,TResult Function( _ErrorWithRetryDialog value)?  errorWithRetryDialog,TResult Function( _RequiredLoginDialog value)?  requiredLoginDialog,TResult Function( _MessageWithTitleDialog value)?  messageWithTitleDialog,TResult Function( _AlertDialog value)?  alertDialog,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConfirmDialog() when confirmDialog != null:
return confirmDialog(_that);case _ErrorWithRetryDialog() when errorWithRetryDialog != null:
return errorWithRetryDialog(_that);case _RequiredLoginDialog() when requiredLoginDialog != null:
return requiredLoginDialog(_that);case _MessageWithTitleDialog() when messageWithTitleDialog != null:
return messageWithTitleDialog(_that);case _AlertDialog() when alertDialog != null:
return alertDialog(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ConfirmDialog value)  confirmDialog,required TResult Function( _ErrorWithRetryDialog value)  errorWithRetryDialog,required TResult Function( _RequiredLoginDialog value)  requiredLoginDialog,required TResult Function( _MessageWithTitleDialog value)  messageWithTitleDialog,required TResult Function( _AlertDialog value)  alertDialog,}){
final _that = this;
switch (_that) {
case _ConfirmDialog():
return confirmDialog(_that);case _ErrorWithRetryDialog():
return errorWithRetryDialog(_that);case _RequiredLoginDialog():
return requiredLoginDialog(_that);case _MessageWithTitleDialog():
return messageWithTitleDialog(_that);case _AlertDialog():
return alertDialog(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ConfirmDialog value)?  confirmDialog,TResult? Function( _ErrorWithRetryDialog value)?  errorWithRetryDialog,TResult? Function( _RequiredLoginDialog value)?  requiredLoginDialog,TResult? Function( _MessageWithTitleDialog value)?  messageWithTitleDialog,TResult? Function( _AlertDialog value)?  alertDialog,}){
final _that = this;
switch (_that) {
case _ConfirmDialog() when confirmDialog != null:
return confirmDialog(_that);case _ErrorWithRetryDialog() when errorWithRetryDialog != null:
return errorWithRetryDialog(_that);case _RequiredLoginDialog() when requiredLoginDialog != null:
return requiredLoginDialog(_that);case _MessageWithTitleDialog() when messageWithTitleDialog != null:
return messageWithTitleDialog(_that);case _AlertDialog() when alertDialog != null:
return alertDialog(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  Func0<void>? onPressed)?  confirmDialog,TResult Function( String message,  Func0<void>? onRetryPressed)?  errorWithRetryDialog,TResult Function()?  requiredLoginDialog,TResult Function( String title,  String message,  String? buttonText,  VoidCallback? onConfirm,  Color? buttonColor,  bool isSuccess,  Widget? icon,  bool showIcon)?  messageWithTitleDialog,TResult Function( String title,  String message,  String positive,  String? negative,  VoidCallback? onPositiveClick,  VoidCallback? onNegativeClick,  Color? positiveColor,  bool isVertical,  Widget? icon)?  alertDialog,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConfirmDialog() when confirmDialog != null:
return confirmDialog(_that.message,_that.onPressed);case _ErrorWithRetryDialog() when errorWithRetryDialog != null:
return errorWithRetryDialog(_that.message,_that.onRetryPressed);case _RequiredLoginDialog() when requiredLoginDialog != null:
return requiredLoginDialog();case _MessageWithTitleDialog() when messageWithTitleDialog != null:
return messageWithTitleDialog(_that.title,_that.message,_that.buttonText,_that.onConfirm,_that.buttonColor,_that.isSuccess,_that.icon,_that.showIcon);case _AlertDialog() when alertDialog != null:
return alertDialog(_that.title,_that.message,_that.positive,_that.negative,_that.onPositiveClick,_that.onNegativeClick,_that.positiveColor,_that.isVertical,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  Func0<void>? onPressed)  confirmDialog,required TResult Function( String message,  Func0<void>? onRetryPressed)  errorWithRetryDialog,required TResult Function()  requiredLoginDialog,required TResult Function( String title,  String message,  String? buttonText,  VoidCallback? onConfirm,  Color? buttonColor,  bool isSuccess,  Widget? icon,  bool showIcon)  messageWithTitleDialog,required TResult Function( String title,  String message,  String positive,  String? negative,  VoidCallback? onPositiveClick,  VoidCallback? onNegativeClick,  Color? positiveColor,  bool isVertical,  Widget? icon)  alertDialog,}) {final _that = this;
switch (_that) {
case _ConfirmDialog():
return confirmDialog(_that.message,_that.onPressed);case _ErrorWithRetryDialog():
return errorWithRetryDialog(_that.message,_that.onRetryPressed);case _RequiredLoginDialog():
return requiredLoginDialog();case _MessageWithTitleDialog():
return messageWithTitleDialog(_that.title,_that.message,_that.buttonText,_that.onConfirm,_that.buttonColor,_that.isSuccess,_that.icon,_that.showIcon);case _AlertDialog():
return alertDialog(_that.title,_that.message,_that.positive,_that.negative,_that.onPositiveClick,_that.onNegativeClick,_that.positiveColor,_that.isVertical,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  Func0<void>? onPressed)?  confirmDialog,TResult? Function( String message,  Func0<void>? onRetryPressed)?  errorWithRetryDialog,TResult? Function()?  requiredLoginDialog,TResult? Function( String title,  String message,  String? buttonText,  VoidCallback? onConfirm,  Color? buttonColor,  bool isSuccess,  Widget? icon,  bool showIcon)?  messageWithTitleDialog,TResult? Function( String title,  String message,  String positive,  String? negative,  VoidCallback? onPositiveClick,  VoidCallback? onNegativeClick,  Color? positiveColor,  bool isVertical,  Widget? icon)?  alertDialog,}) {final _that = this;
switch (_that) {
case _ConfirmDialog() when confirmDialog != null:
return confirmDialog(_that.message,_that.onPressed);case _ErrorWithRetryDialog() when errorWithRetryDialog != null:
return errorWithRetryDialog(_that.message,_that.onRetryPressed);case _RequiredLoginDialog() when requiredLoginDialog != null:
return requiredLoginDialog();case _MessageWithTitleDialog() when messageWithTitleDialog != null:
return messageWithTitleDialog(_that.title,_that.message,_that.buttonText,_that.onConfirm,_that.buttonColor,_that.isSuccess,_that.icon,_that.showIcon);case _AlertDialog() when alertDialog != null:
return alertDialog(_that.title,_that.message,_that.positive,_that.negative,_that.onPositiveClick,_that.onNegativeClick,_that.positiveColor,_that.isVertical,_that.icon);case _:
  return null;

}
}

}

/// @nodoc


class _ConfirmDialog implements AppPopupInfo {
  const _ConfirmDialog({this.message = '', this.onPressed});
  

@JsonKey() final  String message;
 final  Func0<void>? onPressed;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConfirmDialogCopyWith<_ConfirmDialog> get copyWith => __$ConfirmDialogCopyWithImpl<_ConfirmDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConfirmDialog&&(identical(other.message, message) || other.message == message)&&(identical(other.onPressed, onPressed) || other.onPressed == onPressed));
}


@override
int get hashCode => Object.hash(runtimeType,message,onPressed);

@override
String toString() {
  return 'AppPopupInfo.confirmDialog(message: $message, onPressed: $onPressed)';
}


}

/// @nodoc
abstract mixin class _$ConfirmDialogCopyWith<$Res> implements $AppPopupInfoCopyWith<$Res> {
  factory _$ConfirmDialogCopyWith(_ConfirmDialog value, $Res Function(_ConfirmDialog) _then) = __$ConfirmDialogCopyWithImpl;
@useResult
$Res call({
 String message, Func0<void>? onPressed
});




}
/// @nodoc
class __$ConfirmDialogCopyWithImpl<$Res>
    implements _$ConfirmDialogCopyWith<$Res> {
  __$ConfirmDialogCopyWithImpl(this._self, this._then);

  final _ConfirmDialog _self;
  final $Res Function(_ConfirmDialog) _then;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? onPressed = freezed,}) {
  return _then(_ConfirmDialog(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,onPressed: freezed == onPressed ? _self.onPressed : onPressed // ignore: cast_nullable_to_non_nullable
as Func0<void>?,
  ));
}


}

/// @nodoc


class _ErrorWithRetryDialog implements AppPopupInfo {
  const _ErrorWithRetryDialog({this.message = '', this.onRetryPressed});
  

@JsonKey() final  String message;
 final  Func0<void>? onRetryPressed;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorWithRetryDialogCopyWith<_ErrorWithRetryDialog> get copyWith => __$ErrorWithRetryDialogCopyWithImpl<_ErrorWithRetryDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ErrorWithRetryDialog&&(identical(other.message, message) || other.message == message)&&(identical(other.onRetryPressed, onRetryPressed) || other.onRetryPressed == onRetryPressed));
}


@override
int get hashCode => Object.hash(runtimeType,message,onRetryPressed);

@override
String toString() {
  return 'AppPopupInfo.errorWithRetryDialog(message: $message, onRetryPressed: $onRetryPressed)';
}


}

/// @nodoc
abstract mixin class _$ErrorWithRetryDialogCopyWith<$Res> implements $AppPopupInfoCopyWith<$Res> {
  factory _$ErrorWithRetryDialogCopyWith(_ErrorWithRetryDialog value, $Res Function(_ErrorWithRetryDialog) _then) = __$ErrorWithRetryDialogCopyWithImpl;
@useResult
$Res call({
 String message, Func0<void>? onRetryPressed
});




}
/// @nodoc
class __$ErrorWithRetryDialogCopyWithImpl<$Res>
    implements _$ErrorWithRetryDialogCopyWith<$Res> {
  __$ErrorWithRetryDialogCopyWithImpl(this._self, this._then);

  final _ErrorWithRetryDialog _self;
  final $Res Function(_ErrorWithRetryDialog) _then;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,Object? onRetryPressed = freezed,}) {
  return _then(_ErrorWithRetryDialog(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,onRetryPressed: freezed == onRetryPressed ? _self.onRetryPressed : onRetryPressed // ignore: cast_nullable_to_non_nullable
as Func0<void>?,
  ));
}


}

/// @nodoc


class _RequiredLoginDialog implements AppPopupInfo {
  const _RequiredLoginDialog();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequiredLoginDialog);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppPopupInfo.requiredLoginDialog()';
}


}




/// @nodoc


class _MessageWithTitleDialog implements AppPopupInfo {
  const _MessageWithTitleDialog({this.title = '', this.message = '', this.buttonText = null, this.onConfirm = null, this.buttonColor = null, this.isSuccess = true, this.icon = null, this.showIcon = true});
  

@JsonKey() final  String title;
@JsonKey() final  String message;
@JsonKey() final  String? buttonText;
@JsonKey() final  VoidCallback? onConfirm;
@JsonKey() final  Color? buttonColor;
@JsonKey() final  bool isSuccess;
@JsonKey() final  Widget? icon;
@JsonKey() final  bool showIcon;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageWithTitleDialogCopyWith<_MessageWithTitleDialog> get copyWith => __$MessageWithTitleDialogCopyWithImpl<_MessageWithTitleDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageWithTitleDialog&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.buttonText, buttonText) || other.buttonText == buttonText)&&(identical(other.onConfirm, onConfirm) || other.onConfirm == onConfirm)&&(identical(other.buttonColor, buttonColor) || other.buttonColor == buttonColor)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.showIcon, showIcon) || other.showIcon == showIcon));
}


@override
int get hashCode => Object.hash(runtimeType,title,message,buttonText,onConfirm,buttonColor,isSuccess,icon,showIcon);

@override
String toString() {
  return 'AppPopupInfo.messageWithTitleDialog(title: $title, message: $message, buttonText: $buttonText, onConfirm: $onConfirm, buttonColor: $buttonColor, isSuccess: $isSuccess, icon: $icon, showIcon: $showIcon)';
}


}

/// @nodoc
abstract mixin class _$MessageWithTitleDialogCopyWith<$Res> implements $AppPopupInfoCopyWith<$Res> {
  factory _$MessageWithTitleDialogCopyWith(_MessageWithTitleDialog value, $Res Function(_MessageWithTitleDialog) _then) = __$MessageWithTitleDialogCopyWithImpl;
@useResult
$Res call({
 String title, String message, String? buttonText, VoidCallback? onConfirm, Color? buttonColor, bool isSuccess, Widget? icon, bool showIcon
});




}
/// @nodoc
class __$MessageWithTitleDialogCopyWithImpl<$Res>
    implements _$MessageWithTitleDialogCopyWith<$Res> {
  __$MessageWithTitleDialogCopyWithImpl(this._self, this._then);

  final _MessageWithTitleDialog _self;
  final $Res Function(_MessageWithTitleDialog) _then;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? message = null,Object? buttonText = freezed,Object? onConfirm = freezed,Object? buttonColor = freezed,Object? isSuccess = null,Object? icon = freezed,Object? showIcon = null,}) {
  return _then(_MessageWithTitleDialog(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,buttonText: freezed == buttonText ? _self.buttonText : buttonText // ignore: cast_nullable_to_non_nullable
as String?,onConfirm: freezed == onConfirm ? _self.onConfirm : onConfirm // ignore: cast_nullable_to_non_nullable
as VoidCallback?,buttonColor: freezed == buttonColor ? _self.buttonColor : buttonColor // ignore: cast_nullable_to_non_nullable
as Color?,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Widget?,showIcon: null == showIcon ? _self.showIcon : showIcon // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _AlertDialog implements AppPopupInfo {
  const _AlertDialog({this.title = '', this.message = '', this.positive = '', this.negative = null, this.onPositiveClick = null, this.onNegativeClick = null, this.positiveColor = null, this.isVertical = false, this.icon = null});
  

@JsonKey() final  String title;
@JsonKey() final  String message;
@JsonKey() final  String positive;
@JsonKey() final  String? negative;
@JsonKey() final  VoidCallback? onPositiveClick;
@JsonKey() final  VoidCallback? onNegativeClick;
@JsonKey() final  Color? positiveColor;
@JsonKey() final  bool isVertical;
@JsonKey() final  Widget? icon;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertDialogCopyWith<_AlertDialog> get copyWith => __$AlertDialogCopyWithImpl<_AlertDialog>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertDialog&&(identical(other.title, title) || other.title == title)&&(identical(other.message, message) || other.message == message)&&(identical(other.positive, positive) || other.positive == positive)&&(identical(other.negative, negative) || other.negative == negative)&&(identical(other.onPositiveClick, onPositiveClick) || other.onPositiveClick == onPositiveClick)&&(identical(other.onNegativeClick, onNegativeClick) || other.onNegativeClick == onNegativeClick)&&(identical(other.positiveColor, positiveColor) || other.positiveColor == positiveColor)&&(identical(other.isVertical, isVertical) || other.isVertical == isVertical)&&(identical(other.icon, icon) || other.icon == icon));
}


@override
int get hashCode => Object.hash(runtimeType,title,message,positive,negative,onPositiveClick,onNegativeClick,positiveColor,isVertical,icon);

@override
String toString() {
  return 'AppPopupInfo.alertDialog(title: $title, message: $message, positive: $positive, negative: $negative, onPositiveClick: $onPositiveClick, onNegativeClick: $onNegativeClick, positiveColor: $positiveColor, isVertical: $isVertical, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$AlertDialogCopyWith<$Res> implements $AppPopupInfoCopyWith<$Res> {
  factory _$AlertDialogCopyWith(_AlertDialog value, $Res Function(_AlertDialog) _then) = __$AlertDialogCopyWithImpl;
@useResult
$Res call({
 String title, String message, String positive, String? negative, VoidCallback? onPositiveClick, VoidCallback? onNegativeClick, Color? positiveColor, bool isVertical, Widget? icon
});




}
/// @nodoc
class __$AlertDialogCopyWithImpl<$Res>
    implements _$AlertDialogCopyWith<$Res> {
  __$AlertDialogCopyWithImpl(this._self, this._then);

  final _AlertDialog _self;
  final $Res Function(_AlertDialog) _then;

/// Create a copy of AppPopupInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? message = null,Object? positive = null,Object? negative = freezed,Object? onPositiveClick = freezed,Object? onNegativeClick = freezed,Object? positiveColor = freezed,Object? isVertical = null,Object? icon = freezed,}) {
  return _then(_AlertDialog(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,positive: null == positive ? _self.positive : positive // ignore: cast_nullable_to_non_nullable
as String,negative: freezed == negative ? _self.negative : negative // ignore: cast_nullable_to_non_nullable
as String?,onPositiveClick: freezed == onPositiveClick ? _self.onPositiveClick : onPositiveClick // ignore: cast_nullable_to_non_nullable
as VoidCallback?,onNegativeClick: freezed == onNegativeClick ? _self.onNegativeClick : onNegativeClick // ignore: cast_nullable_to_non_nullable
as VoidCallback?,positiveColor: freezed == positiveColor ? _self.positiveColor : positiveColor // ignore: cast_nullable_to_non_nullable
as Color?,isVertical: null == isVertical ? _self.isVertical : isVertical // ignore: cast_nullable_to_non_nullable
as bool,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as Widget?,
  ));
}


}

// dart format on
