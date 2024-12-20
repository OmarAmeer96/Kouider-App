import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_cubit.dart';
import 'package:kouider_app/features/home/logic/home_cubit/home_state.dart';
import 'package:kouider_app/features/home/presentation/widgets/home_floating_filter_button.dart';

class HomeFloatingfilterButtonBlocBuilder extends StatelessWidget {
  const HomeFloatingfilterButtonBlocBuilder({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state is Success
            ? Positioned(
                left: 12,
                top: MediaQuery.of(context).size.height * 0.6,
                child: HomeFloatingFilterButton(
                  onPressed: onPressed,
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
