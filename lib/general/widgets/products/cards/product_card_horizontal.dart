import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/shadow_styles.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [AppShadowStyle.verticalProductCardShadow],
        borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
        color: dark ? AppColors.darkerGrey : AppColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail with Stack for Overlaying Discount and Heart
          Stack(
            children: [
              /// Base Image
              const RoundedImage(
                height: 110,
                imageUrl: IconImages.productImage1,
                borderRadius: AppSizes.cardRadiusSm,
              ),

              /// Discount Label
              Positioned(
                top: 8,
                left: 8,
                child: RoundedContainer(
                  radius: AppSizes.sm,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.sm, vertical: AppSizes.xs),
                  child: Text(
                    '25%',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: AppColors.white),
                  ),
                ),
              ),

              /// Heart Icon
              const Positioned(
                top: 8,
                right: 8,
                child: CircleIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          const SizedBox(width: AppSizes.spaceBtwItems),

          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Product Title
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child:
                      ProductTitle(title: 'Strawberry Mojito', smallSize: true),
                ),

                Text(
                  'Toko Minum',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextPrice(price: 'IDR 55.000'),
                    Container(
                      decoration: const BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppSizes.borderRadiusMd),
                              bottomRight: Radius.circular(
                                  AppSizes.productImageRadius))),
                      child: const SizedBox(
                          width: AppSizes.iconLg * 1.2,
                          height: AppSizes.iconLg * 1.2,
                          child: Center(
                              child:
                                  Icon(Iconsax.add, color: AppColors.white))),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
