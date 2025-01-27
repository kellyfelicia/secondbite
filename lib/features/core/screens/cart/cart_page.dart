import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/controller/cart_controller.dart';
import 'package:project_secondbite/features/core/models/cart_model.dart'; // Add this import
import 'package:project_secondbite/features/core/screens/order/order_page.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();

    return Scaffold(
      appBar: AppBars(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text('Your cart is empty.', style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          itemCount: cartController.cartItems.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          itemBuilder: (_, index) {
            final CartItem item =
                cartController.cartItems.keys.elementAt(index);
            final quantity = cartController.cartItems[item] ?? 0;

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    RoundedImage(
                      isNetworkImage: true,
                      imageUrl: item
                          .item.img, // Changed to access through item property
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.item
                                .name, // Changed to access through item property
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            '${(item.item.price * quantity).toStringAsFixed(2)}', // Calculate total price
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              cartController.updateQuantity(item, quantity - 1);
                            } else {
                              cartController.removeFromCart(item);
                            }
                          },
                        ),
                        Text(
                          '$quantity',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () =>
                              cartController.updateQuantity(item, quantity + 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      // Add back the bottom navigation bar
      bottomNavigationBar: Obx(() {
        final total = cartController.getTotalPrice();
        return Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: cartController.cartItems.isEmpty
                ? null
                : () => Get.to(() => const OrderPage()),
            child: Text('Order Now (${total.toStringAsFixed(2)})'),
          ),
        );
      }),
    );
  }
}
