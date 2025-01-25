import 'package:flutter/material.dart';
import 'package:project_secondbite/features/core/screens/product_reviews/widgets/overall_rating.dart';
import 'package:project_secondbite/features/core/screens/product_reviews/widgets/rating_indicator.dart';
import 'package:project_secondbite/general/widgets/appbar/appbar.dart';
import 'package:project_secondbite/general/widgets/products/ratings/rating_bar.dart';
import 'package:project_secondbite/general/widgets/products/ratings/user_review_card.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';

class ReviewDetailsPage extends StatelessWidget {
  const ReviewDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OverallProductRating(),
              AppRatingBar(rating: 4.9),
              Text('12,561', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: AppSizes.spaceBtwSections),

              //user review list

              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
              UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
