import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/product/widget/product_desc.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/custom_shape/select_button.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isDescriptionSelected = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Product image
              RoundedImage(
                imageUrl: IconImages.productImage1,
                borderRadius: 0,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBars(
                  showBackArrow: true,
                  actions: [
                    CircleIcon(
                      icon: Iconsax.heart,
                      color: Colors.red,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Title and Price Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    'Strawberry Mojito',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  // Price
                  Text(
                    'Rp. 55.000',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  Row(
                    children: [
                      SelectableButton(
                        text: 'Description',
                        isSelected: isDescriptionSelected,
                        onPressed: () {
                          setState(() {
                            isDescriptionSelected =
                                true; // Set Description tab selected
                          });
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceBtwItems),
                      SelectableButton(
                        text: 'Reviews',
                        isSelected: !isDescriptionSelected,
                        onPressed: () {
                          setState(() {
                            isDescriptionSelected =
                                false; // Set Reviews tab selected
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Product Description or Reviews
                  Expanded(
                    child: SingleChildScrollView(
                      child: ProductDescriptionOrReviews(
                        isDescriptionSelected: isDescriptionSelected,
                        text:
                            'The Strawberry Mojito is made with fresh strawberries, mint leaves, lime juice, white rum, simple syrup, and soda water, all mixed together to create a refreshing, fruity, and bubbly cocktail with a hint of sweetness and a burst of citrus.',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Add to Cart'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
