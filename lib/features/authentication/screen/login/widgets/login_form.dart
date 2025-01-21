import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/authentication/screen/pass_config/forget_pass.dart';
import 'package:project_secondbite/features/authentication/screen/register/register_page.dart';
import 'package:project_secondbite/navigation_menu.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TextString.emailText,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check),
                  labelText: TextString.passwordText,
                  suffixIcon: Icon(Iconsax.eye_slash),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text(TextString.rememberMeText),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPass()),
                    child: Text(TextString.forgotPasswordText,
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const NavigationMenu()),
                  child: const Text(TextString.loginButtonText),
                ),
              ),
              const SizedBox(
                height: AppSizes.spaceBtwItems,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(TextString.dontHaveAccountText),
                    TextButton(
                      onPressed: () => Get.to(() => const RegisterPage()),
                      child: Text(TextString.registerButtonText,
                          style: TextStyle(fontSize: 14)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
