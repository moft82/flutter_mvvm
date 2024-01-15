import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../config/app_color.dart';
import '../config/app_font.dart';
import '../config/enum.dart';

class Toast{
  /// State ot Toast
  bool isPlaying = false;

  /// Duration ot Toast
  static const Duration toastDuration = Duration(seconds: 2);

  void showToast({required BuildContext context, required String contents, required ToastType toastType}){
    if(!isPlaying){
      final fToast = FToast();
      fToast.init(context);

      fToast.showToast(
          child: ToastBox(contents: contents, toastType: toastType),
          toastDuration: const Duration(seconds: 2),
          positionedToastBuilder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 100,
                  child: GestureDetector(
                    child: child,
                    onTap: () {
                      // 토스트 메시지 클릭 시, 메시지가 사라지도록 함.
                      // fToast.removeCustomToast();
                    },
                  ),
                ),
              ],
            );
          });
    }


    isPlaying = true;
    Timer(toastDuration, () {
      isPlaying = false;
    });

  }

}

class ToastBox extends StatelessWidget {
  String contents;
  ToastType toastType;

  ToastBox({super.key, required this.contents, required this.toastType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 52,
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 18.0.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0.r),
          border: Border.all(color: toastType.color, width: 0.60.w),
          color: AppColor.white.withOpacity(0.9)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(toastType.svg,
              width: 24.w, height: 24.w),
          SizedBox(width: 12.0.w),
          Text(contents, style: TextStyles.normalTextM.copyWith(
              color: AppColor.grayColor09)),
          const Expanded(child: SizedBox()),
          SizedBox(width: 12.0.w),
        ],
      ),
    );
  }
}
