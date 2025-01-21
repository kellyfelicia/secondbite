import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/utils/constants/colors.dart';


class CartView extends StatelessWidget {
  const CartView({super.key, required this.onPressed, required this.iconColor});

  final Color? iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.bag, color: iconColor),
        ),
        Positioned(
          right: 5,
          top: 25,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: AppColors.white,
                      fontSizeFactor: 0.8,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
