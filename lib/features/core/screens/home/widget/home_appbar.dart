import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/personalization/controllers/user_controller.dart';
import 'package:project_secondbite/general/effects/shimmer.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/product_cart/cart.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/texts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    
    return AppBars(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextString.homeAppBartitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.white),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const AppShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: AppColors.grey),
              );
            }
          }),
        ],
      ),
      actions: const [
        CartView(
          iconColor: AppColors.white,
        ),
      ],
    );
  }
}
