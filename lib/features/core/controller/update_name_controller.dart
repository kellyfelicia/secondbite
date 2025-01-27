import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/data/repositories/user_repository.dart';
import 'package:project_secondbite/features/core/screens/profile/profile.dart';
import 'package:project_secondbite/features/personalization/controllers/user_controller.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/helpers/network_manager.dart';
import 'package:project_secondbite/utils/popups/fullscreen_loader.dart';
import 'package:project_secondbite/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get to => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      FullScreenLoaders.openLoadingDialog(
          'We are updating your information...', IconImages.loadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoaders.stopLoading();
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        FullScreenLoaders.stopLoading();
        return;
      }

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleFields(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      FullScreenLoaders.stopLoading();

      AppLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your name has been updated successfully.');

      Get.off(() => const ProfilePage());
    } catch (e) {
      FullScreenLoaders.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
