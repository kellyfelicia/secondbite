import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/controller/home_controller.dart';
import 'package:project_secondbite/features/core/screens/product/product_detail.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/features/core/models/catalog_home_model.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';


class CardVertical extends StatelessWidget {
  final FoodMenuItem item;

  const CardVertical({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          builder: (BuildContext context) {
            return FractionallySizedBox(
              alignment: Alignment.topCenter,
              heightFactor: 0.82,
              child: ProductDetail(item: item),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: AppSizes.sm, right: AppSizes.sm),
        child: Container(
          width: 180,
          padding: const EdgeInsets.all(AppSizes.sm),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: dark ? Colors.black45 : AppColors.grey,
                blurRadius: 7,
                offset: const Offset(0, 3)
              )
            ],
            borderRadius: BorderRadius.circular(AppSizes.productImageRadius),
            color: dark ? AppColors.lightBlack : AppColors.white,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  RoundedImage(
                    isNetworkImage: true,
                    imageUrl: item.img,
                    imageRadius: true,
                    height: 110,
                    width: 150,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() => CircleIcon(
                      icon: controller.isInWishlist(item) 
                          ? Iconsax.heart5 
                          : Iconsax.heart,
                      color: Colors.red,
                      onPressed: () => controller.toggleWishlist(item),
                    )),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems / 2),

              // Use SingleChildScrollView for overflow handling
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Dynamic Product Title
                        ProductTitle(
                          title: item.name, // Use dynamic name
                          maxLines: 2,
                          smallSize: true,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems / 2),
                      ],
                    ),
                  ),
                ),
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.sm),
                    child: TextPrice(
                      price: '${item.price}', // Use dynamic price
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SizedBox(
                      width: AppSizes.iconLg * 1.2,
                      height: AppSizes.iconLg * 1.2,
                      child: Center(
                        child: Icon(
                          Iconsax.add,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
