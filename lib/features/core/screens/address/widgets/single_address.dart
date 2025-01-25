import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return RoundedContainer(
      padding: EdgeInsets.all(AppSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? AppColors.primaryColor.withOpacity(0.6)
          : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : AppColors.grey,
      margin: EdgeInsets.only(bottom: AppSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? AppColors.darkMode
                        : AppColors.lightMode
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sylus',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: AppSizes.sm / 2),
              const Text('(+62) 895 6262',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: AppSizes.sm / 2),
              Text(
                'Jalan Kakek Kamu, Krukut, Taman Sari, Jakarta Barat, DKI Jakarta',
                softWrap: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
