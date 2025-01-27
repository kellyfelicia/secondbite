import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/controller/home_controller.dart';
import 'package:project_secondbite/features/core/screens/all_products/all_products.dart';
import 'package:project_secondbite/features/core/screens/home/widget/header_home.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_appbar.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_categories.dart';
import 'package:project_secondbite/features/core/screens/home/widget/promo_banner.dart';
import 'package:project_secondbite/general/widgets/products/cards/card_vertical.dart';
import 'package:project_secondbite/general/widgets/custom_shape/search_bar.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the HomeController and listen to the data
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderHome(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: 50),
                  SearchBars(
                    text: 'Search Menu ...',
                    icon: Iconsax.search_normal,
                  ),
                ],
              ),
            ),

            // Categories section

            // Banner
            Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoBanner(
                    banners: [
                      IconImages.bannerPromo,
                      IconImages.bannerPromo2,
                      IconImages.bannerPromo3
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  HeadingText(
                    title: 'Top Picks For You',
                    showActionButton: true,
                    buttonTitle: 'View All',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwInputFields),
                  Obx(() {
                    if (homeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (homeController.errorMessage.isNotEmpty) {
                      return Center(
                          child: Text(homeController.errorMessage.value));
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: homeController.menuItems.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) {
                          final item = homeController.menuItems[index];
                          return CardVertical(item: item);
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
