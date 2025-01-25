import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(
      {super.key,
      this.onPressed,
      this.textColor,
      this.buttonTitle = 'View All',
      this.showActionButton = false,
      required this.title});

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          if (showActionButton)
            TextButton(onPressed: () {}, child: Text(buttonTitle))
        ],
      )
    ]);
  }
}
