
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verified_icon.dart';
import '../../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 70,
          height: 70,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor:
          dark ? TColors.darkerGrey : TColors.light,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        ///TITLE & PRICE & SIZE
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(
                child: TProductTitleText(
                  title:
                  'Black Sport shoes for Real Madrid FC,',
                  maxLines: 2,
                ),
              ),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: 'UK 08 ', style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}