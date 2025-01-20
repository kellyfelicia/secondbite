import 'package:flutter/material.dart';
import 'app.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/controller_onboarding/onboarding_controller.dart';

void main() {
  Get.put(OnboardingController());
  runApp(const App());
}
