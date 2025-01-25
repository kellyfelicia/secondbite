import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class BillingSection extends StatelessWidget {
  const BillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal: ', style: Theme.of(context).textTheme.bodyMedium),
            Text('275.000', style: Theme.of(context).textTheme.labelMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Delivery fee: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('15.000', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax & Service Fee: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('15.000', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text('15.000', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ],
    );
  }
}
