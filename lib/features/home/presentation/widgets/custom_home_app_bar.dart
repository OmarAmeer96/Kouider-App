import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 10, right: 2),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(SvgAssets.homeBackIcon),
              ),
              Container(
                height: 46,
                padding: const EdgeInsets.all(6),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "استلام من",
                          style: Styles.font11AppBarBold,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgAssets.homeLocationIcon,
                            ),
                            horizontalSpace(4),
                            Text(
                              "فرع مول العرب",
                              style: Styles.font12AppBarSemiBold,
                            ),
                            horizontalSpace(16),
                            SvgPicture.asset(
                              SvgAssets.homeDropDownIcon,
                              width: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Container(
                  width: 42,
                  height: 42,
                  padding: const EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(SvgAssets.homeSearchIcon),
                  ),
                ),
              ),
            ],
          ),
        ),
        verticalSpace(20),
        Divider(
          color: Color(0xffd4dcf1),
          thickness: 0.5,
        ),
      ],
    );
  }
}
