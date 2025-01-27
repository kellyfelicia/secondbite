import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class SuccessVerified extends StatelessWidget {
  final String image, title, subtitle, text;
  final VoidCallback onPressed;

  const SuccessVerified(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.onPressed,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: AssetImage(image),
                  width: AppHelperFunctions.screenWidth() * 0.6,
                ),
                const SizedBox(height: AppSizes.spaceBtwItems),
                // Title
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                // Subtitle
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.spaceBtwSections),
                // Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(text),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
