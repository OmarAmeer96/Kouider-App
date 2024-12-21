import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/theming/font_family_helper.dart';
import 'package:kouider_app/core/theming/styles.dart';

DropdownMenuItem<String> buildDropDownItem({
  required String value,
  required String text,
}) {
  return DropdownMenuItem(
    value: value,
    child: Text(
      text,
      style: Styles.font17ProductItemBold.copyWith(
        fontSize: 14.sp,
        fontFamily: FontFamilyHelper.vazirmatnMedium,
        color: Colors.grey[900],
      ),
    ),
  );
}
