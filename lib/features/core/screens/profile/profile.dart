import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/address/address.dart';
import 'package:project_secondbite/features/core/screens/home/widget/header_home.dart';
import 'package:project_secondbite/features/core/screens/profile/profile_details.dart';
import 'package:project_secondbite/features/core/screens/profile/setting_menu.dart';
import 'package:project_secondbite/features/core/screens/profile/widgets/profile_card.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- Header
            HeaderHome(
              height: 210,
              child: Column(
                children: [
                  AppBars(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AppColors.white),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems / 2),

                  // User Profile Card
                  ProfileCard(
                      onTap: () => Get.to(() => const ProfileDetailsPage())),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwSections),
            Padding(
              padding: EdgeInsets.all(AppSizes.defaultSpace),
              child: Column(
                children: [
                  const HeadingText(title: 'Account Settings'),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  SettingMenu(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set your addresses for delivery',
                    OnTap: () => Get.to(() => const UserAddressPage()),
                  ),
                  SettingMenu(
                    icon: Iconsax.discount_shape,
                    title: 'Promos',
                    subtitle: 'Promos and coupons',
                  ),
                  SettingMenu(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subtitle: 'Notification settings'),
                  SettingMenu(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Privacy settings'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
