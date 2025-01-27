import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/controller/cart_controller.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/add_qty.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/item_cart.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/features/core/models/catalog_home_model.dart'; // Add this import

class AppCartItems extends StatelessWidget {
  const AppCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.find<CartController>();

    return Padding(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Obx(() {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (_, __) =>
              const SizedBox(height: AppSizes.spaceBtwSections),
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) {
            final cartItemEntry = cartController.cartItems.entries.toList()[index];
            final cartItem = cartItemEntry.key;
            final quantity = cartItemEntry.value;

            return Column(
              children: [
                ItemCart(cartItem: cartItem),
                if (showAddRemoveButtons)
                  const SizedBox(height: AppSizes.spaceBtwItems),
                if (showAddRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 70),
                          AddQtyCart(item: cartItem),
                        ],
                      ),
                      TextPrice(price: '${cartItem.item.price * quantity}')
                    ],
                  ),
              ],
            );
          },
        );
      }),
    );
  }
}