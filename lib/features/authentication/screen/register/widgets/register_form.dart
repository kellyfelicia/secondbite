import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/controllers/register/register_controller.dart';
import 'package:project_secondbite/features/authentication/screen/register/verify_email.dart';
import 'package:project_secondbite/features/authentication/screen/register/widgets/terms_condition.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';
import 'package:project_secondbite/utils/validation/validator.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final dark = AppHelperFunctions.isDarkMode(context);

    return Form(
      key: controller.registerformKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // ---First Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: TextString.firstNameText,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: AppSizes.spaceBtwInputFields),

              // ---Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      AppValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: TextString.lastNameText,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // ---Email
          TextFormField(
            controller: controller.email,
            validator: (value) => AppValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: TextString.emailText,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // ---Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => AppValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: TextString.phoneNumberText,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: AppSizes.spaceBtwInputFields,
          ),

          // ---Username
          TextFormField(
              controller: controller.username,
              validator: (value) =>
                  AppValidator.validateEmptyText('First Name', value),
              decoration: const InputDecoration(
                labelText: TextString.usernameText,
                prefixIcon: Icon(Iconsax.user),
              )),
          const SizedBox(height: AppSizes.spaceBtwInputFields),

          // ---Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => AppValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: TextString.passwordText,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: AppSizes.spaceBtwInputFields),
          const TermsCondi(),
          const SizedBox(
            height: AppSizes.spaceBtwSections,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.register(),
                child: const Text(TextString.createAccountText)),
          )
        ],
      ),
    );
  }
}
