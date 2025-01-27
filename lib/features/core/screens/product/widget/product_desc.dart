import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:project_secondbite/features/core/screens/product_reviews/review_details.dart';
import 'package:project_secondbite/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

class ProductDescriptionOrReviews extends StatelessWidget {
  final bool isDescriptionSelected;
  final String text;

  const ProductDescriptionOrReviews({
    super.key,
    required this.isDescriptionSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return isDescriptionSelected
        ? ReadMoreText(
            text,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show More',
            trimExpandedText: ' Less',
            moreStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
            lessStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          )
        : Row(
            children: [
              const Icon(
                Iconsax.star5,
                color: Colors.amber,
                size: 24, // Adjust the icon size if necessary
              ),
              const SizedBox(width: AppSizes.spaceBtwItems / 2),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '5.0',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const TextSpan(
                      text: ' (1000+)',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    TextSpan(
                      text: 'See All Reviews',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewDetailsPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
