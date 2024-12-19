import 'package:flutter/material.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/helpers/extensions.dart';
import 'package:kouider_app/core/routing/routes.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';
import 'package:kouider_app/features/splash/presentation/widgets/fading_logo.dart';
import 'package:kouider_app/features/splash/presentation/widgets/sliding_text.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  late Animation<double> opacityAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorsManager.primaryColor,
        // gradient: LinearGradient(
        //   begin: Alignment(0.00, 1.00),
        //   end: Alignment(0, -1),
        //   colors: [
        //     ColorsManager.primaryColor,
        //     ColorsManager.primaryColor,
        //     ColorsManager.primaryColor,
        //   ],
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadingLogo(
            opacityAnimation: opacityAnimation,
            image: SvgAssets.homeFavIconActive,
            height: 70,
          ),
          FadingLogo(
            opacityAnimation: opacityAnimation,
            image: SvgAssets.kouiderLogo,
            height: 400,
          ),
          SlidingText(
            slidingAnimation: slidingAnimation,
            opacityAnimation: opacityAnimation,
          ),
        ],
      ),
    );
  }

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    // Sliding Animation
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);

    // Opacity Animation
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0),
      ),
    );
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (mounted) {
          context.pushReplacementNamed(Routes.homeView);
        }
      },
    );
  }
}
