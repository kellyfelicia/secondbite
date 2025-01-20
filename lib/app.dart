import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/screen/login/login_page.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/onboarding.dart';
import 'package:project_secondbite/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      getPages: [
        GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
        GetPage(name: '/login', page: () => const LoginPage()),
      ],
      initialRoute: '/onboarding',
      defaultTransition: Transition.fade,
    );
  }
}
