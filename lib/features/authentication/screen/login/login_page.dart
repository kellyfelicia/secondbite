import 'package:flutter/material.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/divider_form.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/login_form.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/login_header.dart';
import 'package:project_secondbite/features/authentication/screen/login/widgets/social_auth.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.paddingWithAppBarHeight,
          child: Column(
            children: [
              //header
              LoginHeader(),
              const SizedBox(height: AppSizes.spaceBtwSections),
              //form
              LoginForm(),
              SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              //divider
              DividerWidget(text: TextString.orSignWith),
              const SizedBox(
                height: AppSizes.spaceBtwSections,
              ),
              //footer
              SocialAuth()
            ],
          ),
        ),
      ),
    );
  }
}
