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
import 'package:kouider_app/features/home/presentation/widgets/home_section_header.dart';

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
    return Container(
      color: ColorsManager.scaffoldBackgroundColor,
      child: Column(
        children: [
          CustomHomeAppBar(),
          Expanded(
            child: SingleChildScrollView(
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
    );
  }

  Widget setupSuccessState(Products productsResponse) {
    return Column(
      children: [
        HomeSectionHeader(
          title: "حلويات غربية",
        ),
        GridView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: productsResponse.products!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        productsResponse.products![index].mainImg!.src!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productsResponse.products![index].arName!,
                          style: Styles.font13SelectionWidgetActive,
                        ),
                        verticalSpace(4),
                        Text(
                          productsResponse.products![index].price.toString(),
                          style: Styles.font13SelectionWidgetActive.copyWith(
                            color: ColorsManager.mainBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
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
