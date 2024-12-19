import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/theming/styles.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.font21HomeHeaderBold,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(SvgAssets.homeDropDownIcon),
        ),
      ],
    );
  }
}
