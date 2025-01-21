import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/home/widget/header_home.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_appbar.dart';
import 'package:project_secondbite/features/core/screens/home/widget/home_categories.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/search_bar.dart';
import 'package:project_secondbite/features/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          HeaderHome(
            child: Column(
              children: [
                const HomeAppBar(),
                const SizedBox(height: 50),
                const SearchBars(
                  text: 'Search Menu ...',
                  icon: Iconsax.search_normal,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwSections),
          const HeadingText(
            title: 'Popular Categories',
            showActionButton: false,
          ),
          const SizedBox(height: AppSizes.spaceBtwItems),
          HomeCategories(),
        ],
      ),
    );
  }
}
