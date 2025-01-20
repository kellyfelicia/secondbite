import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: () {},
                icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(IconImages.googleIcon),
                ))),
        SizedBox(
          width: AppSizes.spaceBtwSections,
        ),
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: () {},
                icon: const Image(
                  width: AppSizes.iconMd,
                  height: AppSizes.iconMd,
                  image: AssetImage(IconImages.facebookIcon),
                )))
      ],
    );
  }
}

