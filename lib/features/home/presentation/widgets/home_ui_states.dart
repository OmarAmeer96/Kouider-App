import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/core/widgets/custom_fading_widget.dart';
import 'package:kouider_app/features/home/data/models/products.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_home_item_loading_widget.dart';
import 'package:kouider_app/features/home/presentation/widgets/home_section_header.dart';
import 'package:kouider_app/features/home/presentation/widgets/product_item.dart';

Widget setupsLoadingState() {
  return const CustomFadingWidget(
    child: Padding(
      padding: EdgeInsets.only(top: 16),
      child: CustomHomeItemLoadingWidget(),
    ),
  );
}

Widget setupSuccessState(
  BuildContext context,
  Products productsResponse,
) {
  final cubit = context.read<HomeCubit>();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      HomeSectionHeader(title: "حلويات غربية"),
      verticalSpace(5),
      ...cubit.allProducts.map(
        (product) => ProductItem(
          product: product,
          isLastItem: product == cubit.allProducts.last,
        ),
      ),
      if (cubit.isLoadingMore)
        const CustomFadingWidget(
          child: Padding(
            padding: EdgeInsets.only(top: 16),
            child: LoadingItem(),
          ),
        ),
    ],
  );
}

Widget setupErrorState(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).size.height * 0.3,
      left: 16,
      right: 16,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'حدث خطأ ما، يرجى المحاولة مرة أخرى',
          textAlign: TextAlign.center,
          style: Styles.font17ProductItemBold.copyWith(
            fontSize: 20,
            color: ColorsManager.primaryColor,
          ),
        ),
        verticalSpace(16),
        ElevatedButton(
          onPressed: () {
            context.read<HomeCubit>().getProducts();
          },
          child: Text("إعادة المحاولة", style: Styles.font17ProductItemBold),
        ),
      ],
    ),
  );
}
