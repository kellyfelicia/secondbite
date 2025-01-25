import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class addQtyCart extends StatelessWidget {
  const addQtyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {}),
        const SizedBox(width: AppSizes.spaceBtwItems),
        Text('2', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(width: AppSizes.spaceBtwItems),
        CircleIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: AppSizes.md,
            color: AppColors.white,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {}),
      ],
    );
  }
}
