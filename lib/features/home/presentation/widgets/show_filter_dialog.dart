import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kouider_app/core/theming/font_family_helper.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';

void showFilterDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('الفلاتر', style: Styles.font22ProductItemPrice),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الحد الأدنى للسعر: EGP ${context.read<HomeCubit>().minPrice ?? 0}',
                        style: Styles.font17ProductItemBold,
                      ),
                      Slider(
                        value: (context.read<HomeCubit>().minPrice ?? 0)
                            .toDouble(),
                        min: 0,
                        max: 10000,
                        divisions: 100,
                        label: context.read<HomeCubit>().minPrice?.toString(),
                        onChanged: (value) {
                          setState(() {
                            context.read<HomeCubit>().minPrice = value.toInt();
                          });
                        },
                      ),
                      Text(
                        'الحد الأقصى للسعر: EGP ${context.read<HomeCubit>().maxPrice ?? 10000}',
                        style: Styles.font17ProductItemBold,
                      ),
                      Slider(
                        value: (context.read<HomeCubit>().maxPrice ?? 10000)
                            .toDouble(),
                        min: 0,
                        max: 10000,
                        divisions: 100,
                        label: context.read<HomeCubit>().maxPrice?.toString(),
                        onChanged: (value) {
                          setState(() {
                            context.read<HomeCubit>().maxPrice = value.toInt();
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'ترتيب حسب:',
                        style: Styles.font17ProductItemBold,
                      ),
                      DropdownButton<String>(
                        value: context.read<HomeCubit>().sortCriteria,
                        hint: Text(
                          'معايير الترتيب',
                          style: Styles.font17ProductItemBold.copyWith(
                            fontSize: 14.sp,
                            fontFamily: FontFamilyHelper.vazirmatnMedium,
                            color: Colors.grey[600],
                          ),
                        ),
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: 'price',
                            child: Text(
                              'السعر',
                              style: Styles.font17ProductItemBold.copyWith(
                                fontSize: 14.sp,
                                fontFamily: FontFamilyHelper.vazirmatnMedium,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'date',
                            child: Text(
                              'التاريخ',
                              style: Styles.font17ProductItemBold.copyWith(
                                fontSize: 14.sp,
                                fontFamily: FontFamilyHelper.vazirmatnMedium,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'alphabetical',
                            child: Text(
                              'أبجدي',
                              style: Styles.font17ProductItemBold.copyWith(
                                fontSize: 14.sp,
                                fontFamily: FontFamilyHelper.vazirmatnMedium,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            context.read<HomeCubit>().sortCriteria = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Text(
                        'ترتيب الفلاتر:',
                        style: Styles.font17ProductItemBold,
                      ),
                      DropdownButton<String>(
                        value: context.read<HomeCubit>().sortArrangement,
                        hint: Text(
                          'ترتيب الفلاتر',
                          style: Styles.font17ProductItemBold.copyWith(
                            fontSize: 14.sp,
                            fontFamily: FontFamilyHelper.vazirmatnMedium,
                            color: Colors.grey[600],
                          ),
                        ),
                        isExpanded: true,
                        items: [
                          DropdownMenuItem(
                            value: 'ASC',
                            child: Text(
                              'تصاعدي',
                              style: Styles.font17ProductItemBold.copyWith(
                                fontSize: 14.sp,
                                fontFamily: FontFamilyHelper.vazirmatnMedium,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: 'DESC',
                            child: Text(
                              'تنازلي',
                              style: Styles.font17ProductItemBold.copyWith(
                                fontSize: 14.sp,
                                fontFamily: FontFamilyHelper.vazirmatnMedium,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            context.read<HomeCubit>().sortArrangement = value;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.read<HomeCubit>().resetFilters();
              Navigator.pop(context);
            },
            child: Text(
              'إعادة تعيين الفلاتر',
              style: Styles.font17ProductItemBold.copyWith(color: Colors.red),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().applyFilters(
                    minPrice: context.read<HomeCubit>().minPrice,
                    maxPrice: context.read<HomeCubit>().maxPrice,
                    sortCriteria: context.read<HomeCubit>().sortCriteria,
                    sortArrangement: context.read<HomeCubit>().sortArrangement,
                  );
              Navigator.pop(context);
            },
            child: Text('تطبيق', style: Styles.font17ProductItemBold),
          ),
        ],
      );
    },
  );
}
