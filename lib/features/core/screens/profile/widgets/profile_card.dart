import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/personalization/controllers/user_controller.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ProfileCard extends StatelessWidget {
  ProfileCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;
  final controller = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedImage(
        isNetworkImage: true,
        imageUrl: controller.user.value.profilePicture,
        width: 65,
        height: 60,
        padding: EdgeInsets.only(left: AppSizes.sm),
        fit: BoxFit.cover,
        borderRadius: 100,
      ),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: AppColors.white),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AppColors.white),
      ),
      onTap: onTap,
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Iconsax.edit,
            color: AppColors.white,
          )),
    );
  }
}
