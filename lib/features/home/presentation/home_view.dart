import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/core/widgets/custom_fading_widget.dart';
import 'package:kouider_app/features/home/data/models/products.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_home_item_loading_widget.dart';
import 'package:kouider_app/features/home/presentation/widgets/home_floating_filter_button_bloc_builder.dart';
import 'package:kouider_app/features/home/presentation/widgets/home_section_header.dart';
import 'package:kouider_app/features/home/presentation/widgets/product_item.dart';
import 'package:kouider_app/features/home/presentation/widgets/show_filter_dialog.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeView> {
  int? minPrice;
  int? maxPrice;
  String? sortCriteria;
  String? sortArrangement;

  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: ColorsManager.primaryColor,
      displacement: 10,
      onRefresh: () async {
        context.read<HomeCubit>().getProducts();
      },
      child: Container(
        color: ColorsManager.scaffoldBackgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                CustomHomeAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) =>
                            current is Loading ||
                            current is Success ||
                            current is Error,
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: setupsLoadingState,
                            success: (productsResponse) =>
                                setupSuccessState(productsResponse),
                            error: (_) => setupErrorState(context),
                            orElse: () => SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HomeFloatingfilterButtonBlocBuilder(
              onPressed: () {
                showFilterDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget setupSuccessState(Products productsResponse) {
    return Column(
      children: [
        Column(
          children: [
            HomeSectionHeader(
              title: "حلويات غربية",
            ),
            verticalSpace(5),
            ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: productsResponse.products!.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: productsResponse.products![index],
                  isLastItem: index == productsResponse.products!.length - 1,
                );
              },
            ),
          ],
        )
      ],
    );
  }

  Widget setupsLoadingState() {
    return const CustomFadingWidget(
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: CustomHomeItemLoadingWidget(),
      ),
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
}
