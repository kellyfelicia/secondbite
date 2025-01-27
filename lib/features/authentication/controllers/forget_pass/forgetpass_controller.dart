import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/data/repositories/authentication_repository.dart';
import 'package:project_secondbite/features/authentication/screen/pass_config/reset_pass.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/helpers/network_manager.dart';
import 'package:project_secondbite/utils/popups/fullscreen_loader.dart';
import 'package:project_secondbite/utils/popups/loader.dart';

class ForgetPassController extends GetxController {
  static ForgetPassController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      FullScreenLoaders.openLoadingDialog(
          'Processing your request... ', IconImages.loadingAnimation);
          
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoaders.stopLoading();
        return;
      }

      if (!forgetPassFormKey.currentState!.validate()) {
        FullScreenLoaders.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      FullScreenLoaders.stopLoading();

      AppLoaders.successSnackBar(
          title: 'Email Sent', message: 'Email link is sent to your email.'.tr);

      Get.to(() => ResetPassPage(email: email.text.trim()));
    } catch (e) {
      FullScreenLoaders.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      FullScreenLoaders.openLoadingDialog(
          'Processing your request... ', IconImages.loadingAnimation);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoaders.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      FullScreenLoaders.stopLoading();

      AppLoaders.successSnackBar(
          title: 'Email Sent', message: 'Email link is sent to your email.');
    } catch (e) {
      FullScreenLoaders.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
