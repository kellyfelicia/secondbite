import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class AppShadowStyle {
  static final verticalProductCardShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horizontalProductCardShadow = BoxShadow(
      color: AppColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
