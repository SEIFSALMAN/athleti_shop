import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/texts/product_price_text.dart';
import 'package:athleti_shop/common/widgets/texts/product_title_text.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chips.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        ///Selected Attribute Pricing & Description.
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.lightGrey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TSectionHeading(title: 'Variation',showActionButton: false,),
                  SizedBox(width: TSizes.spaceBtwItems,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TProductTitleText(title: 'Price : ',smallSize: true,),

                          Text("\$25",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          SizedBox(width: TSizes.spaceBtwItems,),
                          TProductPriceText(price: '20')
                          ],
                      ),
                      Row(
                        children: [
                          TProductTitleText(title: "Stock : ",smallSize: true,),
                          Text('In Stock',style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              TProductTitleText(title: "This is Description of the product and it can go upto max 4 lines",smallSize: true,maxLines: 4,)

            ],
          ),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        ///Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                TSectionHeading(title: 'Colors',showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems / 2,),
                TChoiceChip(text: 'Green',selected: false,onSelected: (value){},),
                TChoiceChip(text: 'Blue',selected: true,onSelected: (value){}),
                TChoiceChip(text: 'Yellow',selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                TSectionHeading(title: 'Size',showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems * 2,),
                TChoiceChip(text: 'EU 34',selected: true,onSelected: (value){}),
                TChoiceChip(text: 'EU 36',selected: false,onSelected: (value){}),
                TChoiceChip(text: 'EU 38',selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),

      ],
    );
  }
}

