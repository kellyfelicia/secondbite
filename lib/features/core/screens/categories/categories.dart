import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/products/cards/card_vertical.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/products/cards/product_card_horizontal.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/general/widgets/texts/product_title.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/products/cards/product_card_horizontal.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBars(title: Text('Rice'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              const RoundedImage(
                width: double.infinity,
                height: 200,
                imageUrl: IconImages.bannerPromo3,
                borderRadius: AppSizes.md,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              Column(
                children: [
                  HeadingText(
                    title: 'Rice Products',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: AppSizes.spaceBtwItems),
                      itemBuilder: (context, index) {
                        return const ProductCardHorizontal();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
