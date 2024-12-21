import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/theming/font_family_helper.dart';
import 'package:kouider_app/core/theming/styles.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    this.onChanged,
    required this.hintText,
    required this.value,
  });

  final List<DropdownMenuItem<String>> items;
  final void Function(String?)? onChanged;
  final String hintText;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      hint: Text(
        hintText,
        style: Styles.font17ProductItemBold.copyWith(
          fontSize: 14.sp,
          fontFamily: FontFamilyHelper.vazirmatnMedium,
          color: Colors.grey[600],
        ),
      ),
      isExpanded: true,
      items: items,
      onChanged: onChanged,
    );
  }
}
