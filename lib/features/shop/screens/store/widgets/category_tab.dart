import 'package:athleti_shop/common/widgets/layouts/grid_layout.dart';
import 'package:athleti_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brands/brands_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Brands
            TBrandShowCase(images: [
              TImages.productImage3 , TImages.productImage2 , TImages.productImage1
            ],),
            SizedBox(height: TSizes.spaceBtwItems,),

            ///Products
            TSectionHeading(title: 'You might like',showActionButton: true,onPressed: (){},),
            SizedBox(height: TSizes.spaceBtwItems,),
            TGridLayout(itemCount: 8, itemBuilder: (_,index) => TProductCardVertical())
          ],
        ),
      ),
    ]
    );
  }
}
