import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/controller/cart_controller.dart';
import 'package:project_secondbite/features/core/controller/home_controller.dart';
import 'package:project_secondbite/features/core/models/catalog_home_model.dart';
import 'package:project_secondbite/features/core/screens/product/widget/product_desc.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/circle_icon.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/custom_shape/select_button.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class ProductDetail extends StatefulWidget {
  final FoodMenuItem item;

  const ProductDetail({super.key, required this.item});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isDescriptionSelected = true;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final cartController = Get.find<CartController>();
    final darkModeEnabled = AppHelperFunctions.isDarkMode(context);
    final isWishlisted = homeController.isInWishlist(widget.item);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with image and wishlist toggle
          Stack(
            children: [
              RoundedImage(
                isNetworkImage: true,
                imageUrl: widget.item.img,
                borderRadius: 0,
                height: 300,
                width: double.infinity,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBars(
                  showBackArrow: true,
                  actions: [
                    CircleIcon(
                      icon: isWishlisted ? Iconsax.heart5 : Iconsax.heart,
                      color: Colors.red,
                      onPressed: () {
                        setState(() {
                          homeController.toggleWishlist(widget.item);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Product Details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.item.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),
                  // Product Price
                  Text(
                    'Rp. ${widget.item.price}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Toggle between Description and Reviews
                  Row(
                    children: [
                      SelectableButton(
                        text: 'Description',
                        isSelected: isDescriptionSelected,
                        onPressed: () {
                          setState(() {
                            isDescriptionSelected = true;
                          });
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceBtwItems),
                      SelectableButton(
                        text: 'Reviews',
                        isSelected: !isDescriptionSelected,
                        onPressed: () {
                          setState(() {
                            isDescriptionSelected = false;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Description or Reviews Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: ProductDescriptionOrReviews(
                        isDescriptionSelected: isDescriptionSelected,
                        text: isDescriptionSelected
                            ? (widget.item.description?.isNotEmpty ?? false
                                ? widget.item.description!
                                : 'No description available')
                            : 'No reviews available',
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwSections),
                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        cartController.addToCart(widget.item);
                        Get.snackbar(
                          'Success',
                          '${widget.item.name} has been added to your cart.',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green.withOpacity(0.8),
                          colorText: Colors.white,
                        );
                      },
                      child: const Text('Add to Cart'),
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
