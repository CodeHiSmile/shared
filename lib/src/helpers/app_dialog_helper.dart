import 'package:flutter/material.dart';

enum DialogStatus { success, error, information }

class AppDialogHelper {
  AppDialogHelper._();

  static showDialogConfirm(
    context, {
    String? title,
    String? message,
    String? buttonNameCancel,
    String? buttonNameConfirm,
    Function? onCancelAction,
    Function? onConfirmAction,
    double? height,
    Widget? widgetContent,
    bool? barrierDismissible,
  }) {
    /*  showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: BaseColors.backgroundWhite,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title ?? "Thông báo",
                    style: UITextStyle.heading2SemiBold.copyWith(
                      color: BaseColors.textTitle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  widgetContent ??
                      Text(
                        message ?? 'Xác nhận thay đổi',
                        textAlign: TextAlign.center,
                        style: UITextStyle.body2Regular,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: BaseButton(
                          text: buttonNameCancel ?? 'Hủy bỏ',
                          backgroundColor: BaseColors.backgroundGray,
                          textStyle: UITextStyle.body2Medium.copyWith(
                            color: BaseColors.textLabel,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            if (onCancelAction != null) {
                              onCancelAction();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BaseButton(
                          insertPadding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 11.5,
                          ),
                          text: buttonNameConfirm ?? 'Xác nhận',
                          onTap: () {
                            Navigator.pop(context);
                            if (onConfirmAction != null) {
                              onConfirmAction();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );*/
  }

  static showDialogInfo(
    context, {
    String? title,
    String? message,
    String? buttonNameConfirm,
    Function? onConfirmAction,
    double? height,
    Widget? widgetContent,
    bool? barrierDismissible,
  }) {
    /* showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: BaseColors.backgroundWhite,
          child: SizedBox(
            height: height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title ?? "Thông báo",
                    style: UITextStyle.heading2SemiBold.copyWith(
                      color: BaseColors.textTitle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  widgetContent ??
                      Text(
                        message ?? '',
                        textAlign: TextAlign.center,
                        style: UITextStyle.body2Regular,
                      ),
                  const SizedBox(height: 24),
                  BaseButton(
                    text: buttonNameConfirm ?? 'Xác nhận',
                    onTap: () {
                      Navigator.pop(context);
                      if (onConfirmAction != null) {
                        onConfirmAction();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );*/
  }

  static showDialogCenter(
    BuildContext context, {
    required String message,
    required DialogStatus status,
    Function? onConfirm,
    bool? barrierDismissible,
  }) {
    /*showDialog(
      context: context,
      barrierColor: Colors.black12,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        Widget buildIcon;
        if (status == DialogStatus.success) {
          buildIcon = MyAssets.icons.iconSuccess.svg(
            colorFilter: const ColorFilter.mode(Colors.green, BlendMode.srcIn),
          );
        } else if (status == DialogStatus.error) {
          buildIcon = MyAssets.icons.iconWarning.svg(
            colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
          );
        } else {
          buildIcon = MyAssets.icons.iconWarning.svg(
            colorFilter: const ColorFilter.mode(Colors.orange, BlendMode.srcIn),
          );
        }

        return InfoDialog(
          message: message,
          icon: buildIcon,
          onConfirm: onConfirm,
        );
      },
    );*/
  }

  static Future<void> showAlertSetting(
    BuildContext context, {
    String? title,
    String? message,
  }) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Container();
        /*  return CupertinoAlertDialog(
          title: Text(title ?? "Thông báo", style: UITextStyle.body1Regular),
          content: Text(
            message ?? '',
            style: UITextStyle.body2Regular.copyWith(
              color: BaseColors.textBody,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                "Hủy",
                style: UITextStyle.body2SemiBold.copyWith(
                  color: BaseColors.error,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                "Mở cài đặt",
                style: UITextStyle.body2SemiBold.copyWith(
                  color: BaseColors.textTitle,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
            ),
          ],
        );*/
      },
    );
  }
}
