import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/profile/widgets/profile_menu.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/general/widgets/texts/heading_text.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ProfileDetailsPage extends StatelessWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBars(
          showBackArrow: true,
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      RoundedImage(
                        imageUrl: IconImages.userImage,
                        width: 80,
                        height: 80,
                        borderRadius: 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Change Profile Picture'))
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Divider(),
                SizedBox(height: AppSizes.spaceBtwItems),
                HeadingText(
                    title: 'Profile Information', showActionButton: false),
                SizedBox(height: AppSizes.spaceBtwItems),
                ProfileMenu(title: 'Name', value: 'Sylus', onPressed: () {}),
                ProfileMenu(
                    title: 'Username',
                    value: '@onychinus_leader',
                    onPressed: () {}),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Divider(),
                SizedBox(height: AppSizes.spaceBtwItems),
                HeadingText(
                    title: 'Personal Information', showActionButton: false),
                SizedBox(height: AppSizes.spaceBtwItems),
                ProfileMenu(
                    title: 'User ID',
                    value: '1804',
                    icon: Iconsax.copy,
                    onPressed: () {}),
                ProfileMenu(
                    title: 'Email',
                    value: 'sylusganteng@gmail.com',
                    onPressed: () {}),
                ProfileMenu(
                    title: 'Phone Number',
                    value: '0812345678',
                    onPressed: () {}),
                ProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
                ProfileMenu(
                    title: 'Date of Birth',
                    value: '18 April 1999',
                    onPressed: () {}),
                SizedBox(height: AppSizes.spaceBtwItems / 2),
                Divider(),
                Center(
                  child: TextButton(
                      onPressed: () {},
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
