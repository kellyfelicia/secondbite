import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';

class CircularContainer extends StatelessWidget {
  const CircularContainer(
      {super.key,
      this.width,
      this.height,
      this.padding = 0,
      this.margin,
      this.radius = 400,
      this.backgroundColor = AppColors.white,
      this.child});

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final double padding;
  final double radius;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
