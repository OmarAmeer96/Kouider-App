import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kouider_app/core/helpers/assets.dart';
import 'package:kouider_app/core/helpers/spacing.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/features/home/data/models/product.dart';
import 'package:kouider_app/features/home/presentation/widgets/product_item_image.dart';
import 'package:kouider_app/features/home/presentation/widgets/product_item_products_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.isLastItem,
  });

  final Product product;
  final bool isLastItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLastItem ? 20 : 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ProductItemImage(product: product),
          ),
          horizontalSpace(13),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(12), // Start
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.arName!,
                        style: Styles.font17ProductItemBold,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                Text(
                  "250 جم",
                  style: Styles.font13ProductItemweight,
                ),
                verticalSpace(6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      SvgAssets.homeUsersIcon,
                    ),
                    horizontalSpace(5),
                    Column(
                      children: [
                        verticalSpace(4),
                        Text(
                          "8-7 أفراد",
                          style: Styles.font13ProductItemweight.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // TODO: Make it at the end of the column
                Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      style: Styles.font22ProductItemPrice,
                    ),
                    horizontalSpace(10),
                    ProductItemPointsWidget(),
                  ],
                ),
                verticalSpace(12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
