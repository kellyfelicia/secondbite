import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? IconImages.darkIcon : IconImages.lightIcon),
        ),
        Text(
          TextString.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: AppSizes.xs),
        Text(TextString.loginSubtitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
