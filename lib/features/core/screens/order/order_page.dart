import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/authentication/screen/register/widgets/success_verified.dart';
import 'package:project_secondbite/features/core/screens/cart/widget/app_cart_items.dart';
import 'package:project_secondbite/features/core/screens/home/home.dart';
import 'package:project_secondbite/features/core/screens/order/widgets/address_billing.dart';
import 'package:project_secondbite/features/core/screens/order/widgets/billing_payment.dart';
import 'package:project_secondbite/features/core/screens/order/widgets/billing_amount.dart';
import 'package:project_secondbite/features/core/screens/order/widgets/service_type.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_container.dart';
import 'package:project_secondbite/general/widgets/products/order/coupon_code.dart';
import 'package:project_secondbite/navigation_menu.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBars(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              ServiceType(
                  icon: Iconsax.bag5,
                  title: 'Pickup',
                  subtitle: 'Self Pickup at Store',
                  onSelect: () {}),
              const AppCartItems(showAddRemoveButtons: false),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              const CouponCode(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              RoundedContainer(
                padding: const EdgeInsets.all(AppSizes.md),
                showBorder: true,
                backgroundColor: dark ? AppColors.black : AppColors.white,
                child: const Column(
                  children: [
                    //billing
                    BillingSection(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    //divider
                    Divider(),
                    SizedBox(height: AppSizes.spaceBtwItems),

                    //payment method
                    PaymentBilling(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppSizes.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessVerified(
                image: IconImages.successCheck,
                title: 'Order Success',
                subtitle: 'Your order will be prepared by the seller soon!',
                onPressed: () => Get.offAll(() => const NavigationMenu()),
                text: 'Continue')),
            child: const Text('Order Now'),
          )),
    );
  }
}
