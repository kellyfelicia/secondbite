import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.appBarHeight),
          child: Column(
            children: [
              // Title
              Text(
                TextString.registerTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSizes.spaceBtwSections),

              // Form
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: TextString.firstNameText,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: TextString.lastNameText,
                              prefixIcon: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TextString.emailText,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TextString.phoneNumberText,
                        prefixIcon: Icon(Iconsax.call),
                      ),
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                        decoration: const InputDecoration(
                      labelText: TextString.usernameText,
                      prefixIcon: Icon(Iconsax.user),
                    )),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: TextString.passwordText,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwInputFields),
                    Row(
                      children: [
                        SizedBox(
                            width: 26,
                            height: 24,
                            child:
                                Checkbox(value: true, onChanged: (value) {})),
                        const SizedBox(width: AppSizes.spaceBtwItems),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: '${TextString.agreeToTermsText}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: '${TextString.privacyPolicyText}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? AppColors.white
                                        : AppColors.primaryColor),
                          ),
                          TextSpan(
                            text: '${TextString.andText}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: '${TextString.termsOfServiceText}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(
                                    color: dark
                                        ? AppColors.white
                                        : AppColors.primaryColor),
                          ),
                        ])),
                      ],
                    ),
                    const SizedBox(
                      height: AppSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(TextString.createAccountText)),
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
