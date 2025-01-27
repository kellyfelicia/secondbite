import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:project_secondbite/features/core/screens/profile_change/change_name.dart';
import 'package:project_secondbite/features/personalization/controllers/user_controller.dart';
import 'package:project_secondbite/general/effects/shimmer.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
        appBar: const AppBars(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Obx(() {
                        final networkImage =
                            controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty
                            ? networkImage
                            : IconImages.userImage;

                        return controller.imageUploading.value
                            ? const AppShimmerEffect(
                                width: 89, height: 80, radius: 80)
                            : RoundedImage(
                                imageUrl: image,
                                width: 80,
                                height: 80,
                                borderRadius: 100,
                                isNetworkImage: networkImage.isNotEmpty,
                              );
                      }),
                      TextButton(
                          onPressed: () =>
                              controller.uploadUserProfilePicture(),
                          child: const Text('Change Profile Picture'))
                    ],
                  ),
                ),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const HeadingText(
                    title: 'Profile Information', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),
                ProfileMenu(
                    title: 'Name',
                    value: controller.user.value.fullName,
                    onPressed: () => Get.to(() => const ChangeName())),
                ProfileMenu(
                    title: 'Username',
                    value: controller.user.value.username,
                    onPressed: () {}),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: AppSizes.spaceBtwItems),
                const HeadingText(
                    title: 'Personal Information', showActionButton: false),
                const SizedBox(height: AppSizes.spaceBtwItems),
                ProfileMenu(
                    title: 'User ID',
                    value: controller.user.value.id,
                    icon: Iconsax.copy,
                    onPressed: () {}),
                ProfileMenu(
                    title: 'Email',
                    value: controller.user.value.email,
                    onPressed: () {}),
                ProfileMenu(
                    title: 'Phone Number',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {}),
                ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                ProfileMenu(
                    title: 'Date of Birth',
                    value: '18 April 1999',
                    onPressed: () {}),
                const SizedBox(height: AppSizes.spaceBtwItems / 2),
                const Divider(),
                Center(
                  child: TextButton(
                      onPressed: () => controller.deleteAccountWarningPopup(),
                      child: const Text(
                        'Close Account',
                        style: TextStyle(color: Colors.red),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
