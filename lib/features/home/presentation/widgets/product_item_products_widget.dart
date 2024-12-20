import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/styles.dart';

class ProductItemPointsWidget extends StatelessWidget {
  const ProductItemPointsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0x2619D558),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.homePointsIcon, width: 16),
          horizontalSpace(4),
          Text(
            "50 نقطة",
            style: Styles.font13ProductItemweight,
          ),
        ],
      ),
    );
  }
}
