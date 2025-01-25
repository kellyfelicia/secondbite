import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_secondbite/general/widgets/custom_shape/vertical_icon.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
    required this.title,
    required this.imageUrl,
    this.colour,
    this.onTap,
  });

  final String title, imageUrl;
  final Color? colour;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.defaultSpace),
      child: SizedBox(
        height: 95,
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return IconVerticalWidget(
              title: title,
              image: imageUrl,
              textColor: AppColors.primaryColor,
              onTap: onTap,
            );
          },
        ),
      ),
    );
  }
}
