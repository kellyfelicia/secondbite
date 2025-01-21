import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 220,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            // Adjust the scaling factor to make the pattern bigger
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                'assets/images/pattern-food-header.png',
                fit:
                    BoxFit.cover, // Ensure the image still covers the container
              ),
            ),
          ),
          Positioned(child: child)
        ],
      ),
    );
  }
}
