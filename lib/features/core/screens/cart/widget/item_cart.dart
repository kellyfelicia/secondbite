import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          imageUrl: IconImages.productImage1,
          width: 100,
          height: 100,
          padding: EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.lightGrey,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ProductTitle(
                title: 'Strawberry Mojito',
                maxLines: 2,
                
              ),
              TextPrice(price: 'Rp. 55.000'),
            ],
          ),
        ),
      ],
    );
  }
}
