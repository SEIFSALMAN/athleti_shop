import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/products/ratings/rating_bar_indicator.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(TImages.userProfileImage1),),
                SizedBox(width: TSizes.spaceBtwItems,),
                Text("John Doe",style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded))
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        ///REVIEW
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text("01 Nov , 2024",style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText('Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ',
        trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " less",
          trimCollapsedText: 'show more',
          moreStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
          lessStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        ///Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.lightGrey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Seif Salman's Store",style: Theme.of(context).textTheme.titleMedium),
                    Text("02 Nov, 2023",style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems,),
                ReadMoreText('Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " less",
                  trimCollapsedText: 'show more',
                  moreStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                  lessStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        Divider(),
        SizedBox(height: TSizes.spaceBtwItems,),

      ],
    );
  }
}
