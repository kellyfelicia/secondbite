import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/home/home.dart';
import 'package:project_secondbite/general/layout/grid_layout.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/card_vertical.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CircleIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomePage()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              GridViewLayout(
                  itemCount: 4, itemBuilder: (_, index) => CardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
