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

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: productsResponse.products!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: HomeViewItem(
              productsResponse: productsResponse,
              index: index,
            ),
          );
        },
      ),
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

class HomeViewItem extends StatelessWidget {
  const HomeViewItem({
    super.key,
    required this.productsResponse,
    required this.index,
  });

  final Products productsResponse;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 160,
            child: CachedNetworkImage(
              imageUrl: productsResponse.products![index].mainImg!.src!,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ),
        horizontalSpace(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productsResponse.products![index].arName!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            verticalSpace(8),
            Text(
              productsResponse.products![index].price!,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
