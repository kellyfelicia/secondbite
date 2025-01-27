import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/controller/category_controller.dart';
import 'package:project_secondbite/features/core/screens/categories/categories.dart';
import 'package:project_secondbite/features/core/screens/categories/widgets/categories_shimmer.dart';
import 'package:project_secondbite/general/widgets/custom_shape/vertical_icon.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.title,
    required this.imageUrl,
    this.colour,
    this.onTap,
  });

  final String title, imageUrl;
  final Color? colour;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
      child: Obx(
        () {
          if (categoryController.isLoading.value) {
            return const CategoriesShimmer();
          }
          if (categoryController.featuredCategories.isEmpty) {
            return Center(
                child: Text(
              'No Data Found!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ));
          }
          return SizedBox(
            height: 95,
            child: ListView.builder(
              itemCount: categoryController.featuredCategories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final category = categoryController.featuredCategories[index];
                return IconVerticalWidget(
                  title: category.name,
                  image: category.image,
                  textColor: AppColors.primaryColor,
                  onTap: () => Get.to(() => const CategoriesPage()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
