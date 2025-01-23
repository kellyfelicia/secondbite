import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/home/widget/header_home.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_appbar.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_categories.dart';
import 'package:project_secondbite/features/core/screens/home/widget/promo_banner.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/card_vertical.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/circular_container.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/search_bar.dart';
import 'package:project_secondbite/features/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderHome(
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
            SizedBox(height: AppSizes.spaceBtwSections),
            HeadingText(
              title: 'Popular Categories',
              showActionButton: false,
            ),
            SizedBox(height: AppSizes.spaceBtwItems),
            HomeCategories(),

            // Banner
            Padding(
                padding: EdgeInsets.all(AppSizes.defaultSpace),
                child: PromoBanner(
                  banners: [
                    IconImages.bannerPromo,
                    IconImages.bannerPromo2,
                    IconImages.bannerPromo3
                  ],
                )),

            CardVertical()
          ],
        ),
      ),
    );
  }
}
