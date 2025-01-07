import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/controller_onboarding/onboarding_controller.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/texts.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/widgets/onboarding_dot.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/widgets/onboarding_next.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/widgets/onboarding_skip.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/widgets/onboarding_slice.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingSlice(
                image: IconImages.onboarding1,
                title: TextString.onboardingTitle1,
                subtitle: TextString.onboardingSubTitle1,
              ),
              OnboardingSlice(
                image: IconImages.onboarding2,
                title: TextString.onboardingTitle2,
                subtitle: TextString.onboardingSubTitle2,
              ),
              OnboardingSlice(
                image: IconImages.onboarding3,
                title: TextString.onboardingTitle3,
                subtitle: TextString.onboardingSubTitle3,
              ),
            ],
          ),
          //Skip Button
          const OnboardingSkipButton(),

          //Dot Navigation
          const OnBoardingDotNavigation(),

          //Next Button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
