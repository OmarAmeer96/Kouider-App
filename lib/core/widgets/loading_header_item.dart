import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingHeaderItem extends StatelessWidget {
  const LoadingHeaderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 140.w,
                height: 25.h,
                color: Colors.grey[300],
              ),
              SizedBox(width: 10.w),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20.r),
                ),
                width: 25.w,
                height: 25.h,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                width: 50.w,
                height: 25.h,
              ),
              SizedBox(width: 13.w),
              Container(
                width: 50.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(width: 13.w),
              Container(
                width: 50.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBox(width: 13.w),
              Container(
                width: 50.w,
                height: 25.h,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
