import 'package:athleti_shop/common/styles/shadows.dart';
import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/images/rounded_image.dart';
import 'package:athleti_shop/common/widgets/texts/product_price_text.dart';
import 'package:athleti_shop/common/widgets/texts/product_title_text.dart';
import 'package:athleti_shop/features/shop/screens/products_details/product_detail.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verified_icon.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(()=> ProductDetailScreen()),
      child: Container(
        // padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          children: [
            /// Thumbnail & Wishlist button & Discount Tag
            TRoundedContainer(
              height: 177.5,
              // padding: EdgeInsets.all(TSizes.xs),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail
                  TRoundedImage(imageUrl: TImages.productImage1,height: 400,padding: EdgeInsets.only(top: 10)),

                  /// Discount Tag
                  Positioned(
                    top: 5,
                    left: 5,
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
                      top: 0,
                      right: 0,
                      child: TCircularIcon(
                        icon: CupertinoIcons.heart,
                        color: Colors.red,
                        backgroundColor: Colors.transparent,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(
                    title: 'Red Nike Air Jordan Shoes',
                    smallSize: true,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  TBrandTitleWithVerifiedIcon(title: 'Nike',),
                ],
              ),
            ),

            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: TSizes.sm),
                  child: TProductPriceText(price: '35.0'),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(TSizes.cardRadiusMd),
                          bottomRight: Radius.circular(TSizes.productImageRadius)
                      )
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
    );
  }
}

