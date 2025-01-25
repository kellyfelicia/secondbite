import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/app_cart_items.dart';
import 'package:project_secondbite/features/core/screens/order/order_page.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: AppCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const OrderPage()),
            child: Text('Order Now')),
      ),
    );
  }
}
