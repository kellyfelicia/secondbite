import 'package:flutter/material.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/add_qty.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/item_cart.dart';
import 'package:project_secondbite/general/widgets/texts/text_price.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class AppCartItems extends StatelessWidget {
  const AppCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) =>
            const SizedBox(height: AppSizes.spaceBtwSections),
        itemCount: 5,
        itemBuilder: (_, index) => Column(
          children: [
            //cart item
            ItemCart(),
            if (showAddRemoveButtons) SizedBox(height: AppSizes.spaceBtwItems),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      addQtyCart(),
                    ],
                  ),
                  TextPrice(price: 'Rp. 110.000')
                ],
              ),
          ],
        ),
      ),
    );
  }
}
