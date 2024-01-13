import 'package:flutter/material.dart';
import 'package:flutter_mvvm/config/app_color.dart';

enum ToastType {
  primary(AppColor.primaryColor, 'asset/img/primary_toast_icon.svg'),
  warning(AppColor.warning, 'asset/img/error_toast_icon.svg'),
  success(AppColor.primaryColor, 'asset/img/success_toast_icon.svg'),
  error(AppColor.error, 'asset/img/fail_toast_icon.svg');

  final Color color;
  final String svg;

  const ToastType(this.color, this.svg);


  // factory ToastType.getByCode(String code){
  //   return ToastType.values.firstWhere((value) => value.code == code,
  //       orElse: () => ToastType.undefined);
  // }
}