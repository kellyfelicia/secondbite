import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:project_secondbite/general/effects/shimmer.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.imageRadius = true,
    this.border,
    this.borderRadius = AppSizes.md,
    this.fit = BoxFit.cover,
    this.backgroundColor = AppColors.lightMode,
    this.overlayColor,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final bool imageRadius;
  final BoxBorder? border;
  final double borderRadius;
  final BoxFit fit;
  final Color backgroundColor;
  final Color? overlayColor;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    const defaultImageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlomRxuD2hXxPAPem4LggnMmje2M5z_ZNvRg&s";

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius:
              imageRadius ? BorderRadius.circular(borderRadius) : null,
        ),
        child: ClipRRect(
          borderRadius: imageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl.isEmpty ? defaultImageUrl : imageUrl,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const AppShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) =>
                      Image.network(defaultImageUrl),
                )
              : Image.asset(imageUrl.isEmpty ? defaultImageUrl : imageUrl,
                  fit: fit),
        ),
      ),
    );
  }
}
