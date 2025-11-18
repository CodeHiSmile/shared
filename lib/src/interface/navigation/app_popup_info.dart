import 'package:shared/src/utils/function/function.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_popup_info.freezed.dart';

/// dialog, bottomsheet
@freezed
class AppPopupInfo with _$AppPopupInfo {
  //Định nghĩa các style dialog sẽ hiển thị trong app ở đây

  const factory AppPopupInfo.confirmDialog({
    @Default('') String message,
    Func0<void>? onPressed,
  }) = _ConfirmDialog;

  const factory AppPopupInfo.errorWithRetryDialog({
    @Default('') String message,
    Func0<void>? onRetryPressed,
  }) = _ErrorWithRetryDialog;

  const factory AppPopupInfo.requiredLoginDialog() = _RequiredLoginDialog;

  const factory AppPopupInfo.messageWithTitleDialog({
    @Default('') String title,
    @Default('') String message,
    @Default(null) String? buttonText,
    @Default(null) VoidCallback? onConfirm,
    @Default(null) Color? buttonColor,
    @Default(true) bool isSuccess,
    @Default(null) Widget? icon,
    @Default(true) bool showIcon,
  }) = _MessageWithTitleDialog;

  const factory AppPopupInfo.alertDialog({
    @Default('') String title,
    @Default('') String message,
    @Default('') String positive,
    @Default(null) String? negative,
    @Default(null) VoidCallback? onPositiveClick,
    @Default(null) VoidCallback? onNegativeClick,
    @Default(null) Color? positiveColor,
    @Default(false) bool isVertical,
    @Default(null) Widget? icon,
  }) = _AlertDialog;

  //
  // const factory AppPopupInfo.faceIdErrorDialog(
  //     {@Default(null) VoidCallback? onTryAgain,
  //     @Default(null) VoidCallback? onIgnore}) = _FaceIdErrorDialog;
}
