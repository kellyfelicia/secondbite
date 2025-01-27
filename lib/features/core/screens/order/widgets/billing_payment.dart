import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class PaymentBilling extends StatelessWidget {
  const PaymentBilling({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        HeadingText(
          title: 'Payment Method',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        const SizedBox(height: AppSizes.spaceBtwItems / 2),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 50,
              backgroundColor: dark ? AppColors.white : AppColors.white,
              padding: const EdgeInsets.all(AppSizes.sm),
              child: const Image(
                  image: AssetImage(IconImages.payGopay), fit: BoxFit.contain),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems / 2),
            Text('GoPay', style: Theme.of(context).textTheme.bodyLarge),
          ],
        )
      ],
    );
  }
}
