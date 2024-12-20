import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHomeItemLoadingWidget extends StatelessWidget {
  const CustomHomeItemLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          LoadingHeaderItem(),
          LoadingItem(),
          LoadingItem(),
          LoadingItem(),
          LoadingItem(),
          LoadingItem(),
        ],
      ),
    );
  }
}

class LoadingItem extends StatelessWidget {
  const LoadingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder for Product Image
          Expanded(
            flex: 5,
            child: Container(
              height: 160.h, // Height similar to product image
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(width: 13.w),
          // Placeholder for Product Details
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                // Placeholder for Product Name
                Container(
                  width: 150.w,
                  height: 15.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 10.h),
                // Placeholder for Weight Text
                Container(
                  width: 80.w,
                  height: 10.h,
                  color: Colors.grey[300],
                ),
                SizedBox(height: 6.h),
                // Placeholder for User Icon Row
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
                // Placeholder for Price and Points Row
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
