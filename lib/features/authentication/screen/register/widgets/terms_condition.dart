import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class TermsCondi extends StatelessWidget {
  const TermsCondi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
            width: 26,
            height: 24,
            child: Checkbox(value: true, onChanged: (value) {})),
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
                .apply(color: dark ? AppColors.white : AppColors.primaryColor),
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
                .apply(color: dark ? AppColors.white : AppColors.primaryColor),
          ),
        ])),
      ],
    );
  }
}
