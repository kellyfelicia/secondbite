import 'package:flutter/material.dart';
import 'package:project_secondbite/features/core/models/cart_model.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class ItemCart extends StatelessWidget {
  final CartItem cartItem;

  const ItemCart({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.item.img,
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(AppSizes.sm),
          backgroundColor: AppHelperFunctions.isDarkMode(context)
              ? AppColors.darkerGrey
              : AppColors.lightGrey,
        ),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductTitle(
                title: cartItem.item.name,
                maxLines: 2,
              ),
              TextPrice(price: ' ${cartItem.item.price}'),
            ],
          ),
        ),
      ],
    );
  }
}
