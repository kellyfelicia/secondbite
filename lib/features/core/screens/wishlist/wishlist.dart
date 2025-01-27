// screens/wishlist/wishlist_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/controller/home_controller.dart';
import 'package:project_secondbite/features/core/screens/home/home.dart';
import 'package:project_secondbite/general/layout/grid_layout.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/general/widgets/products/cards/card_vertical.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

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
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                final wishlistItems = controller.wishlistAsList;

                if (wishlistItems.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Iconsax.heart, size: 64, color: Colors.grey),
                        SizedBox(height: 16),
                        Text('Your wishlist is empty'),
                      ],
                    ),
                  );
                }

                return GridViewLayout(
                  itemCount: wishlistItems.length,
                  itemBuilder: (_, index) =>
                      CardVertical(item: wishlistItems[index]),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
