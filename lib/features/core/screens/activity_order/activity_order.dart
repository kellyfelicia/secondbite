import 'package:flutter/material.dart';
import 'package:project_secondbite/features/core/screens/activity_order/widgets/order_list.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ActivityOrderPage extends StatelessWidget {
  const ActivityOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        showBackArrow: true,
        title: Text(
          'Order Activity',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace), child: OrderList()),
    );
  }
}
