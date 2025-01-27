import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/device/device_utility.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
      child: Container(
        width: AppDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
          color: showBackground
              ? dark
                  ? AppColors.black
                  : AppColors.white
              : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: showBorder ? Border.all(color: AppColors.grey) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.grey,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
