import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/core/theming/font_family_helper.dart';

class Styles {
  static TextStyle font11BottomNav = TextStyle(
    color: Color(0xB2425486),
    fontSize: 11.sp,
    fontFamily: FontFamilyHelper.vazirmatnMedium,
  );

  // Remove
  static TextStyle font30OrangeBold = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 30.sp,
    fontFamily: FontFamilyHelper.vazirmatnBold,
  );
}
