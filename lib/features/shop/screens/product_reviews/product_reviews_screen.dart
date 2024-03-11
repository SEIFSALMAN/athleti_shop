import 'package:athleti_shop/features/shop/screens/product_reviews/widgets/progress_indicator_and_rating.dart';
import 'package:athleti_shop/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/rating_bar_indicator.dart';
import 'widgets/overall_rating_progress_indicator.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          "Reviews & Ratings",
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Ratings and reviews are verified and are from people who use the same type of device tha i can ever use!"),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ///OVERALL RATING
              TOverallProductRating(),
              
              TRatingBarIndicator(rating: 4,),
              Text("12,611",style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),

              ///User Review List
              UserReviewCard(),
              UserReviewCard(),
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


