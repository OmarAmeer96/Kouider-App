import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/core/widgets/custom_fading_widget.dart';
import 'package:kouider_app/features/home/data/models/products.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';
import 'package:kouider_app/features/home/presentation/widgets/custom_home_item_loading_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is Loading || current is Success || current is Error,
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return setupsLoadingState();
                  },
                  success: (productsResponse) {
                    // return setupsLoadingState();
                    // return setupErrorState(context);
                    return setupSuccessState(productsResponse);
                  },
                  error: (errorHandler) {
                    return setupErrorState(context);
                  },
                  orElse: () => const SizedBox.shrink(),
                );
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
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
        ),
        verticalSpace(60),
        Text(
          'Products',
          style: Styles.font30OrangeBold,
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
