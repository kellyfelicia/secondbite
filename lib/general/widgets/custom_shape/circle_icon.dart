import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
    this.size,
    this.width,
    this.height,
  });

  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  final double? size, width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 48.0,
      height: height ?? 48.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (AppHelperFunctions.isDarkMode(context)
                ? AppColors.black.withOpacity(0.9)
                : AppColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color ?? Theme.of(context).iconTheme.color,
          size: size ?? 24.0,
        ),
      ),
    );
  }
}
