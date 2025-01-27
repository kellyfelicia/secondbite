import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/bindings/general_bindings.dart';
import 'package:project_secondbite/features/authentication/screen/login/login_page.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/onboarding.dart';
import 'package:project_secondbite/routes/app_routes.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: ThemeApp.lightTheme,
        darkTheme: ThemeApp.darkTheme,
        initialBinding: GeneralBindings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}
