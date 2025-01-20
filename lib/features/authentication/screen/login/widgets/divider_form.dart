import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/colors.dart';
import 'package:project_secondbite/utils/constants/texts.dart';

class DividerForm extends StatelessWidget {
  const DividerForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
          child: Divider(
            color: AppColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          TextString.orSignWith,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: Colors.grey),
        ),
        const Flexible(
          child: Divider(
            color: AppColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
