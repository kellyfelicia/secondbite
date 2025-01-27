import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/controller/home_controller.dart';
import 'package:project_secondbite/general/layout/grid_layout.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/products/cards/card_vertical.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:get/get.dart';
class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the HomeController instance
    final HomeController homeController = Get.find();

    return Scaffold(
      appBar: const AppBars(
        title: Text('Top Picks For You'),
        showBackArrow: true,
      ),
      body: Obx(() {
        // Show loading indicator or error message
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeController.errorMessage.isNotEmpty) {
          return Center(child: Text(homeController.errorMessage.value));
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  GridViewLayout(
                    itemCount: homeController.menuItems.length,
                    itemBuilder: (_, index) => CardVertical(item: homeController.menuItems[index]),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
