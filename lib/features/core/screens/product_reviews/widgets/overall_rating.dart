import 'package:flutter/material.dart';
import 'package:project_secondbite/features/core/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.9',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingIndicator(rateNumber: '5', value: 1.0),
              RatingIndicator(rateNumber: '4', value: 0.7),
              RatingIndicator(rateNumber: '3', value: 0.5),
              RatingIndicator(rateNumber: '2', value: 0.3),
              RatingIndicator(rateNumber: '1', value: 0.1),
              
            ],
          ),
        )
      ],
    );
  }
}
