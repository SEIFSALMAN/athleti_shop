import 'package:athleti_shop/common/widgets/images/circular_image.dart';
import 'package:athleti_shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:athleti_shop/common/widgets/texts/product_price_text.dart';
import 'package:athleti_shop/common/widgets/texts/product_title_text.dart';
import 'package:athleti_shop/utils/constants/enums.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      /// Price and sale price
      children: [
        Row(
          children: [
            ///Sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.9),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text("25%",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            ///Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TProductPriceText(
              price: '175',
              isLarge: true,
            )
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        TProductTitleText(
            title: 'Nike football for UEFA 2024 for Jude Bellingham in London'),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Stack Status

        Row(
          children: [
            TProductTitleText(title: 'Status:'),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.nikeLogo,
              height: 32,
              width: 32,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            SizedBox(width: TSizes.spaceBtwItems / 1.5,),
            Expanded(child: TBrandTitleWithVerifiedIcon(title: "Nike",brandTextSize: TextSizes.medium,))
          ],
        ),
      ],
    );
  }
}
