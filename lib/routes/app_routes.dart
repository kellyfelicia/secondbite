import 'package:get/get.dart';
import 'package:project_secondbite/features/authentication/screen/login/login_page.dart';
import 'package:project_secondbite/features/authentication/screen/onboarding/onboarding.dart';
import 'package:project_secondbite/features/authentication/screen/pass_config/forget_pass.dart';
import 'package:project_secondbite/features/authentication/screen/register/register_page.dart';
import 'package:project_secondbite/features/authentication/screen/register/verify_email.dart';
import 'package:project_secondbite/features/core/screens/address/address.dart';
import 'package:project_secondbite/features/core/screens/cart/cart_page.dart';
import 'package:project_secondbite/features/core/screens/home/home.dart';
import 'package:project_secondbite/features/core/screens/order/order_page.dart';
import 'package:project_secondbite/features/core/screens/profile/profile_details.dart';
import 'package:project_secondbite/features/core/screens/wishlist/wishlist.dart';
import 'package:project_secondbite/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: RoutesPage.home, page: () => const HomePage()),
    GetPage(name: RoutesPage.favourites, page: () => const WishlistPage()),
    GetPage(name: RoutesPage.cart, page: () => CartPage()),
    GetPage(
        name: RoutesPage.userProfile, page: () => const ProfileDetailsPage()),
    GetPage(name: RoutesPage.userAddress, page: () => const UserAddressPage()),
    GetPage(name: RoutesPage.signup, page: () => const RegisterPage()),
    GetPage(name: RoutesPage.verifyEmail, page: () => const VerifyEmail()),
    GetPage(name: RoutesPage.signIn, page: () => const LoginPage()),
    GetPage(name: RoutesPage.forgetPassword, page: () => const ForgetPass()),
    GetPage(name: RoutesPage.onBoarding, page: () => const OnboardingScreen()),
    // Add more GetPage entries as needed
  ];
}
