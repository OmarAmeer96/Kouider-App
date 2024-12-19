import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/core/theming/font_family_helper.dart';

class Styles {
  static TextStyle font11BottomNavMedium = TextStyle(
    color: Color(0xB2425486),
    fontSize: 11.sp,
    fontFamily: FontFamilyHelper.vazirmatnMedium,
  );

  static TextStyle font11AppBarBold = TextStyle(
    color: Color(0xFFB4B4B4),
    fontSize: 11.sp,
    fontFamily: FontFamilyHelper.vazirmatnBold,
  );

  static TextStyle font12AppBarSemiBold = TextStyle(
    color: ColorsManager.textPrimaryColor,
    fontSize: 12.sp,
    fontFamily: FontFamilyHelper.vazirmatnSemiBold,
  );

  static TextStyle font21HomeHeaderBold = TextStyle(
    color: ColorsManager.textPrimaryColor,
    fontSize: 21.sp,
    fontFamily: FontFamilyHelper.vazirmatnBold,
  );

  static TextStyle font13SelectionWidgetActive = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 13.sp,
    fontFamily: FontFamilyHelper.vazirmatnSemiBold,
  );

  // Remove
  static TextStyle font30OrangeBold = TextStyle(
    color: ColorsManager.primaryColor,
    fontSize: 30.sp,
    fontFamily: FontFamilyHelper.vazirmatnBold,
  );
}
