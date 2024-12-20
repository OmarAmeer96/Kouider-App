import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/theming/colors_manager.dart';

class HomeFloatingFilterButton extends StatelessWidget {
  const HomeFloatingFilterButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      backgroundColor: ColorsManager.floatingButtonColor,
      mini: true,
      onPressed: onPressed,
      child: Center(
        child: SvgPicture.asset(
          SvgAssets.homeFilterIcon,
        ),
      ),
    );
  }
}
