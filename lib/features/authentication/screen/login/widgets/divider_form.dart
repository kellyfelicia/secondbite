import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/helpers/helper_functions.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    final dark = AppHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: .5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? AppColors.darkGrey : AppColors.grey,
            thickness: .5,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
