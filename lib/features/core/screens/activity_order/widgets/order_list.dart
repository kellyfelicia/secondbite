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
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(
        height: AppSizes.spaceBtwItems,
      ),
      itemBuilder: (_, index) => RoundedContainer(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        height: 150,
        showBorder: true,
        borderColor: AppColors.grey,
        backgroundColor: dark ? AppColors.darkerGrey : AppColors.softGrey,
        child: Column(
          children: [
            Row(
              children: [
                // --Icon
                const Icon(Iconsax.ship),
                const SizedBox(width: AppSizes.spaceBtwItems / 2),

                // --Status
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(
                            color: AppColors.primaryColor, fontWeightDelta: 1),
                      ),
                      Text('25 Jan 2025',
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),

                // --icon
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.arrow_right_34),
                    iconSize: AppSizes.iconSm)
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            Expanded(
              child: Row(
                children: [
                  // --ROW 1
                  Expanded(
                    child: Row(
                      children: [
                        // --Icon
                        const Icon(Iconsax.tag),
                        const SizedBox(width: AppSizes.spaceBtwItems / 2),

                        // --Status
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text('[#256f7]',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --ROW 2
                  Expanded(
                    child: Row(
                      children: [
                        // --Icon
                        const Icon(Iconsax.calendar),
                        const SizedBox(width: AppSizes.spaceBtwItems / 2),

                        // --Status
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Pickup Date',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              Text('26 Jan 2025',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
