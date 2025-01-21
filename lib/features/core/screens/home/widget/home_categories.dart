
import 'package:flutter/cupertino.dart';
import 'package:project_secondbite/features/general/widgets/custom_shape/vertical_icon.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/images_icon.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return IconVerticalWidget(
            title: 'Beverages',
            image: IconImages.beveragesCat,
            textColor: AppColors.primaryColor,
            onTap: () {},
          );
        },
      ),
    );
  }
}
