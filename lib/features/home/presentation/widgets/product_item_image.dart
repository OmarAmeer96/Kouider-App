import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kouider_app/core/theming/styles.dart';
import 'package:kouider_app/features/home/data/models/product.dart';

class ProductItemImage extends StatelessWidget {
  const ProductItemImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: CachedNetworkImage(
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          imageUrl: product.mainImg!.src!,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline,
                  size: 24,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Couldn't Load the Image 😢",
                  textAlign: TextAlign.center,
                  style: Styles.font11BottomNavMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
