import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/activity_order/activity_order.dart';
import 'package:project_secondbite/features/core/screens/home/home.dart';
import 'package:project_secondbite/features/core/screens/profile/profile.dart';
import 'package:project_secondbite/features/core/screens/wishlist/wishlist.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = AppHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Stack(
          clipBehavior: Clip.none,
          children: [
            NavigationBar(
              height: 70,
              elevation: 0,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              backgroundColor:
                  dark ? AppColors.primaryColor : AppColors.primaryColor,
              indicatorColor: Colors.transparent,
              destinations: [
                _buildNavigationDestination(
                    context, controller, 1, Iconsax.home),
                _buildNavigationDestination(
                    context, controller, 0, Iconsax.receipt),
                _buildNavigationDestination(
                    context, controller, 2, Iconsax.heart),
                _buildNavigationDestination(
                    context, controller, 3, Iconsax.user),
              ],
            ),
            _buildPopOutIcon(controller),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildNavigationDestination(BuildContext context,
      NavigationController controller, int index, IconData icon) {
    final isSelected = controller.selectedIndex.value == index;
    return NavigationDestination(
      icon: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Icon(
          icon,
          size: isSelected ? 22 : 25,
          color: Colors.white,
        ),
      ),
      label: '',
    );
  }

  Widget _buildPopOutIcon(NavigationController controller) {
    return Obx(() {
      final selectedIndex = controller.selectedIndex.value;

      final icon = [
        Iconsax.home,
        Iconsax.receipt,
        Iconsax.heart,
        Iconsax.user,
      ][selectedIndex];

      return AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        bottom: 20,
        left: (selectedIndex * 100.0) + 30,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 25),
        ),
      );
    });
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const ActivityOrderPage(),
    const WishlistPage(),
    const ProfilePage(),
  ];
}
