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

  void showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filters', style: Styles.font22ProductItemPrice),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StatefulBuilder(
                builder: (context, setState) {
                  return Column(
                    children: [
                      Text('Min Price: \$${minPrice ?? 0}'),
                      Slider(
                        value: (minPrice ?? 0).toDouble(),
                        min: 0,
                        max: 1000,
                        divisions: 100,
                        label: minPrice?.toString(),
                        onChanged: (value) {
                          setState(() {
                            minPrice = value.toInt();
                          });
                        },
                      ),
                      Text('Max Price: \$${maxPrice ?? 1000}'),
                      Slider(
                        value: (maxPrice ?? 1000).toDouble(),
                        min: 0,
                        max: 1000,
                        divisions: 100,
                        label: maxPrice?.toString(),
                        onChanged: (value) {
                          setState(() {
                            maxPrice = value.toInt();
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value: sortCriteria,
                        hint: Text('Sort Criteria'),
                        items: ['price', 'date', 'alphabetical']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            sortCriteria = value;
                          });
                        },
                      ),
                      DropdownButton<String>(
                        value: sortArrangement,
                        hint: Text('Sort Arrangement'),
                        items: ['ASC', 'DESC']
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            sortArrangement = value;
                          });
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<HomeCubit>().clearFilters();
                Navigator.pop(context);
              },
              child: Text('Reset Filters'),
            ),
            TextButton(
              onPressed: () {
                context.read<HomeCubit>().applyFilters(
                      minPrice: minPrice,
                      maxPrice: maxPrice,
                      sortCriteria: sortCriteria,
                      sortArrangement: sortArrangement,
                    );
                Navigator.pop(context);
              },
              child: Text('Apply'),
            ),
          ],
        );
      },
    );
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
              onPressed: showFilterDialog,
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
