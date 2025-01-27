import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/data/repositories/authentication_repository.dart';
import 'package:project_secondbite/data/repositories/user_repository.dart';
import 'package:project_secondbite/features/authentication/screen/register/verify_email.dart';
import 'package:project_secondbite/features/personalization/user_model.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/helpers/network_manager.dart';
import 'package:project_secondbite/utils/popups/fullscreen_loader.dart';
import 'package:project_secondbite/utils/popups/loader.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final GlobalKey<FormState> registerformKey = GlobalKey<FormState>();

  Future<void> register() async {
    try {
      // Start Loading
      FullScreenLoaders.openLoadingDialog(
        'We are processing your information ...',
        IconImages.loadingAnimation,
      );

      // Check Internet Connectivity
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!registerformKey.currentState!.validate()) return;

      // Privacy Policy Acceptance
      if (!privacyPolicy.value) {
        FullScreenLoaders.stopLoading();
        AppLoaders.errorSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create an account, you must read and accept the Privacy Policy and Terms.',
        );
        return;
      }

      // Register User
      final UserCredential userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Save Authenticated User
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      AppLoaders.successSnackBar(
        title: 'Congratulations!',
        message:
            'Your account has been created! Verify your email to continue.',
      );
      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      AppLoaders.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
    } finally {
      FullScreenLoaders.stopLoading();
    }
  }
}
