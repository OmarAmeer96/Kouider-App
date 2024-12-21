import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/features/home/presentation/widgets/build_drop_down_item.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_drop_down_button.dart';

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
                      CustomDropDownButton(
                        hintText: 'معايير الترتيب',
                        value: context.read<HomeCubit>().sortCriteria,
                        items: [
                          buildDropDownItem(
                            value: 'price',
                            text: 'السعر',
                          ),
                          buildDropDownItem(
                            value: 'date',
                            text: 'التاريخ',
                          ),
                          buildDropDownItem(
                            value: 'alphabetical',
                            text: 'أبجدي',
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
                      CustomDropDownButton(
                        hintText: 'ترتيب الفلاتر',
                        value: context.read<HomeCubit>().sortArrangement,
                        items: [
                          buildDropDownItem(
                            value: 'ASC',
                            text: 'تصاعدي',
                          ),
                          buildDropDownItem(
                            value: 'DESC',
                            text: 'تنازلي',
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
