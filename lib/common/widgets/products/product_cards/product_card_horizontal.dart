import 'package:athleti_shop/common/styles/shadows.dart';
import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/images/rounded_image.dart';
import 'package:athleti_shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:athleti_shop/common/widgets/texts/product_price_text.dart';
import 'package:athleti_shop/common/widgets/texts/product_title_text.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white),
      child: Row(
        ///Thumbnail
        children: [
          TRoundedContainer(
            height: 120,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                ///Thumbnail Image
                SizedBox(
                    height: 120,
                    width: 120,
                    child: TRoundedImage(
                      imageUrl: TImages.productImage1,
                      applyImageRadius: true,
                    )),

                ///Discount Tag
                Positioned(
                  top: 0,
                  left: 0,
                  child: TRoundedContainer(
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
                ),

                ///Wishlist Button
                Positioned(
                    top: -10,
                    right: -10,
                    child: TCircularIcon(
                      icon: CupertinoIcons.heart,
                      color: Colors.red,
                      backgroundColor: Colors.transparent,
                    ))
              ],
            ),
          ),

          ///Details
          SizedBox(
            width: 172,
            child: Padding(
              padding: EdgeInsets.all(TSizes.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: "Green Nike Shoes for (7) Vini Jr.",
                        smallSize: true,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: "Nike")
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Price
                      Flexible(child: TProductPriceText(price: '256')),
                      ///Add to Cart
                      Container(
                        decoration: BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(child: Icon(CupertinoIcons.add,color: TColors.white)),
                        ),
                      )

                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
