import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/general/widgets/custom_shape/rounded_image.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: RoundedImage(
        imageUrl: IconImages.userImage,
        width: 60,
        height: 60,
        padding: EdgeInsets.only(left: AppSizes.sm),
        fit: BoxFit.cover,
        borderRadius: 100,
      ),
      title: Text(
        'Sylus',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: AppColors.white),
      ),
      subtitle: Text(
        'sylusganteng@gmail.com',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: AppColors.white),
      ),
      onTap: onTap,
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Iconsax.edit,
            color: AppColors.white,
          )),
    );
  }
}
