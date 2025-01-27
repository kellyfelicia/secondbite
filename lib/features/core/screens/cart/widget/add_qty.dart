import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/controller/cart_controller.dart';
import 'package:project_secondbite/features/core/models/cart_model.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class AddQtyCart extends StatelessWidget {
  final CartItem item;
  
  const AddQtyCart({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppColors.white,
            backgroundColor: AppColors.primaryColor,
            onPressed: () => cartController.decrementQuantity(item)),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Obx(() => Text(
            '${cartController.cartItems[item] ?? 0}',
            style: Theme.of(context).textTheme.titleMedium
        )),
        const SizedBox(width: AppSizes.spaceBtwItems),
        CircleIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppColors.white,
            backgroundColor: AppColors.primaryColor,
            onPressed: () => cartController.incrementQuantity(item)),
      ],
    );
  }
}