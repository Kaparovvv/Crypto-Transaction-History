import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_fit_app/commons/theme_helper.dart';

class TextStyleHelper {
  static TextStyle f16w400 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.white,
  );

  static TextStyle f35w400 = TextStyle(
    fontSize: 35.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.white,
  );
  static TextStyle f15w400 = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.black,
  );
  static TextStyle f10w400 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.black,
  );
}
