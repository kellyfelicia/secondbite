import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:project_secondbite/utils/device/device_utility.dart';
import 'package:project_secondbite/features/authentication/controller_onboarding/onboarding_controller.dart';

class OnboardingSkipButton extends StatelessWidget {
  const OnboardingSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnboardingController.instance.skipPage(),
          child: const Text('Skip')),
    );
  }
}
