import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/authentication/controllers/login/login_controller.dart';
import 'package:project_secondbite/features/authentication/screen/pass_config/forget_pass.dart';
import 'package:project_secondbite/features/authentication/screen/register/register_page.dart';
import 'package:project_secondbite/navigation_menu.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';
import 'package:project_secondbite/utils/validation/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final dark = AppHelperFunctions.isDarkMode(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.email,
                validator: (value) => AppValidator.validateEmail(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TextString.emailText,
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) =>
                      AppValidator.validateEmptyText('Password', value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: TextString.passwordText,
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value)),
                      const Text(TextString.rememberMeText),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Get.to(() => const ForgetPass()),
                    child: const Text(TextString.forgotPasswordText,
                        style: TextStyle(fontSize: 14)),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.emailAndPasswordSignIn(),
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
                    const Text(TextString.dontHaveAccountText),
                    TextButton(
                      onPressed: () => Get.to(() => const RegisterPage()),
                      child: const Text(TextString.registerButtonText,
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
