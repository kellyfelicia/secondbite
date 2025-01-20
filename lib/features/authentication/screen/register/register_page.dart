import 'package:flutter/material.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/divider_form.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/social_auth.dart';
import 'package:project_secondbite/features/authentication/screen/register/widgets/register_form.dart';
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
              RegisterForm(),
              const SizedBox(height: AppSizes.spaceBtwSections),

              //divider
              const DividerWidget(
                text: TextString.orSignUpWith,
              ),
              const SizedBox(height: AppSizes.spaceBtwInputFields),

              //social auth
              const SocialAuth(),
            ],
          ),
        ),
      ),
    );
  }
}
