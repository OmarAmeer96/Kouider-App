import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              height: 160.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(width: 13.w),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Container(
                  width: 150.w,
                  height: 15.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 80.w,
                  height: 10.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Container(
                      width: 70.w,
                      height: 10.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 80.w,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                    SizedBox(width: 10.w),
                    Container(
                      width: 40.w,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 15.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
