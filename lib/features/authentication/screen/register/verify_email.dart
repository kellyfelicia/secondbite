import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/screen/login/login_page.dart';
import 'package:project_secondbite/features/authentication/screen/register/widgets/success_verified.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginPage()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: AssetImage(IconImages.onboarding1),
                width: AppHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              // Title
              Text(
                TextString.emailVerificationTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              // Email
              Text(
                'test@gmail.com',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              // Subtitle
              Text(
                TextString.emailVerificationSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessVerified(
                        image: IconImages.onboarding1,
                        title: TextString.accountCreatedTitle,
                        subtitle: TextString.accountCreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginPage()),
                      )),
                  child: const Text(TextString.continueText),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              // Resend Email Button
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(TextString.resendEmailText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
