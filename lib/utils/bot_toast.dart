import 'package:baby_eduction/const/color_schemas.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'bot_toast.dart' as Fluttertoast;

loading({bool visible = true}) {
  if (visible) {
    BotToast.showLoading(
        backgroundColor: Colors.black.withOpacity(0.5),
        align: Alignment.center);
    return Container(
      color: AppColors.blackColor.withOpacity(0.6),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          )),
        ],
      ),
    );
  } else {
    return BotToast.closeAllLoading();
  }
}

showToast({required String text, Duration? time, Color? color}) {
  return BotToast.showText(
    text: text,
    duration: time ?? const Duration(seconds: 2),
    clickClose: true,
    contentColor: color ?? AppColors.greenColor,
  );
}

showErrorToast({required String text, Color? color, Duration? duration}) {
  return BotToast.showText(
    text: text,
    clickClose: true,
    contentColor: color ?? Colors.red,
    duration: duration ?? const Duration(seconds: 2),
  );
}
