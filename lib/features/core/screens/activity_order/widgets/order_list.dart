import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? AppColors.darkerGrey : AppColors.grey,
      child:  Column(
        children: [
          Row(
            children: [

              // --Icon
              Icon(Iconsax.ship),
              SizedBox(width: AppSizes.spaceBtwItems / 2),

              // --Status
              Column(
                children: [
                  Text('Processing',
                  style: Theme.of(context).textTheme.headlineMedium,)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
