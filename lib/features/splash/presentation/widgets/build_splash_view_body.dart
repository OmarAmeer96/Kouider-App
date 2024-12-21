import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';

class BuildSplashViewBody extends StatelessWidget {
  const BuildSplashViewBody({
    super.key,
    required Animation<Offset> leftSlideAnimation,
    required Animation<Offset> rightSlideAnimation,
    required Animation<double> logoScaleAnimation,
  })  : _leftSlideAnimation = leftSlideAnimation,
        _rightSlideAnimation = rightSlideAnimation,
        _logoScaleAnimation = logoScaleAnimation;

  final Animation<Offset> _leftSlideAnimation;
  final Animation<Offset> _rightSlideAnimation;
  final Animation<double> _logoScaleAnimation;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: MediaQuery.of(context).size.width * 0.9,
          child: Align(
            alignment: Alignment.centerLeft,
            child: ClipRect(
              child: SlideTransition(
                position: _leftSlideAnimation,
                child: SvgPicture.asset(
                  SvgAssets.splashItem,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.9,
          child: Align(
            alignment: Alignment.centerRight,
            child: ClipRect(
              child: SlideTransition(
                position: _rightSlideAnimation,
                child: SvgPicture.asset(
                  SvgAssets.splashItem,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Center(
            child: ScaleTransition(
              scale: _logoScaleAnimation,
              child: SvgPicture.asset(
                SvgAssets.kouiderLogo,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
