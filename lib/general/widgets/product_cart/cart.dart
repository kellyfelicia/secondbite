import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/controller/cart_controller.dart';
import 'package:project_secondbite/features/core/screens/cart/cart_page.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class CartView extends StatelessWidget {
  const CartView({super.key, required this.iconColor});

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    final CartController cartController = Get.find<CartController>();

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Cart Icon Button
        IconButton(
          onPressed: () => Get.to(() => CartPage()), // Navigate to CartPage.
          icon: Icon(Iconsax.bag, color: iconColor),
        ),
        // Badge for Item Count
        Obx(() {
          final itemCount = cartController.cartItems.length;
          if (itemCount == 0)
            return const SizedBox(); // Hide badge if cart is empty.

          return Positioned(
            right: 5,
            top: 25,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  '$itemCount',
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: AppColors.white,
                        fontSizeFactor: 0.8,
                      ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}
