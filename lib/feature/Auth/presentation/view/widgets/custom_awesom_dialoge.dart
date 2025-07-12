import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:glowvana/core/utils/app_colors/app_colors.dart';

class CustomAwesomDialoge {
  static void show({
    required BuildContext context,
    required String title,
    required String description,
    required DialogType dialogType,
    AnimType animType = AnimType.scale,
    Color? btnOkColor,
    VoidCallback? onOkPressed,
  }) {
    IconData iconData;
    Color iconColor;

    switch (dialogType) {
      case DialogType.success:
        iconData = Icons.check_circle_outline;
        iconColor = AppColors.green;
        break;
      case DialogType.error:
        iconData = Icons.error_outline;
        iconColor = AppColors.red;
        break;
      default:
        iconData = Icons.info_outline;
        iconColor = AppColors.brown;
    }

    AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: animType,
      title: title,
      desc: description,
      customHeader:  Icon(
          iconData,
          color: iconColor,
          size: 50,
        ),
      btnOkColor: btnOkColor,
      btnOkOnPress: onOkPressed ?? () {},
    ).show();
  }
}
