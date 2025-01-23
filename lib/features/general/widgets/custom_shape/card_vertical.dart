import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/features/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/shadow_styles.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: AppSizes.md),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: dark ? Colors.black45 : AppColors.grey,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: dark ? AppColors.lightBlack : AppColors.white,
          ),
          child: Column(
            children: [
              //thumbail, wl, disc
              Stack(
                children: [
                  //thumbnail
                  RoundedImage(
                      imageUrl: IconImages.productImage1, imageRadius: true),

                  RoundedContainer(
                    radius: AppSizes.sm,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.sm, vertical: AppSizes.xs),
                    child: Text('25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: AppColors.white)),
                  ),

                  const Positioned(
                    top: 0,
                    right: 0,
                    child: CircleIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppSizes.spaceBtwItems / 2),
              Padding(
                  padding: EdgeInsets.only(left: AppSizes.sm),
                  child: Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitle(
                          title: 'Strawberry Mojito',
                          maxLines: 2,
                          smallSize: true,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),
                        Row(
                          children: [
                            Text(
                              'Toko Minum',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rp. 55.000',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            AppSizes.cardRadiusMd),
                                        bottomRight: Radius.circular(
                                            AppSizes.productImageRadius))),
                                child: SizedBox(
                                  width: AppSizes.iconLg * 1.2,
                                  height: AppSizes.iconLg * 1.2,
                                  child: Center(
                                    child: Icon(
                                      Iconsax.add,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
