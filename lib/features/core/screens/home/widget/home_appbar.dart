import 'package:flutter/material.dart';
import 'package:project_secondbite/features/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/features/general/widgets/product_cart/cart.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/texts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBars(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextString.homeAppBartitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: AppColors.grey),
          ),
          Text(
            TextString.homeAppBarSubtitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AppColors.white),
          ),
        ],
      ),
      actions: [
        CartView(onPressed: (){}, iconColor: AppColors.white,),
      ],
    );
  }
}

