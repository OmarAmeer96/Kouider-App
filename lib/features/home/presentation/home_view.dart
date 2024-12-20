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
import 'package:kouider_app/features/home/presentation/widgets/home_floating_filter_button.dart';
import 'package:kouider_app/features/home/presentation/widgets/home_section_header.dart';
import 'package:kouider_app/features/home/presentation/widgets/product_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeView> {
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
                    // TODO: Remove if the RefreshIndicator is not working
                    // physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: BlocBuilder<HomeCubit, HomeState>(
                        buildWhen: (previous, current) =>
                            current is Loading ||
                            current is Success ||
                            current is Error,
                        builder: (context, state) {
                          return state.maybeWhen(
                            loading: () {
                              return setupsLoadingState();
                            },
                            success: (productsResponse) {
                              return setupSuccessState(productsResponse);
                            },
                            error: (errorHandler) {
                              return setupErrorState(context);
                            },
                            orElse: () => const SizedBox.shrink(),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return state is Success
                    ? Positioned(
                        left: 12,
                        top: MediaQuery.of(context).size.height * 0.6,
                        child: HomeFloatingFilterButton(
                          onPressed: () {
                            context.read<HomeCubit>().getProducts();
                          },
                        ),
                      )
                    : const SizedBox.shrink();
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
            ListView.builder(
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: productsResponse.products!.length,
              itemBuilder: (context, index) {
                return ProductItem(
                  product: productsResponse.products![index],
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
            'An error occurred while fetching data, please try again later',
            textAlign: TextAlign.center,
            style: Styles.font30OrangeBold.copyWith(
              fontSize: 20,
            ),
          ),
          verticalSpace(16),
          ElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().getProducts();
            },
            child: Text("Retry"),
          ),
        ],
      ),
    );
  }
}
