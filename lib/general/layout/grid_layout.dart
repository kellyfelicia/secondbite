import 'package:flutter/material.dart';
import 'package:project_secondbite/general/widgets/products/cards/card_vertical.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class GridViewLayout extends StatelessWidget {
  const GridViewLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 100,
            crossAxisSpacing: AppSizes.gridViewSpacing,
            mainAxisExtent: 288),
        itemBuilder: itemBuilder);
  }
}
