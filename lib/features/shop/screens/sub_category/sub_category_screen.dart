import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/images/rounded_image.dart';
import 'package:athleti_shop/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Sports"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Banner
                TRoundedImage(imageUrl: TImages.promoBanner1,width: double.infinity,applyImageRadius: true,),
                SizedBox(height: TSizes.spaceBtwSections,),
                
                ///Sub-Categories
                Column(
                  children: [
                    TSectionHeading(title: 'Sports shirts',onPressed: (){},),
                    SizedBox(height: TSizes.spaceBtwItems / 2,),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index) =>TProductCardHorizontal(),
                          separatorBuilder: (_,__) => SizedBox(width: TSizes.spaceBtwItems),
                          itemCount: 10),
                    )
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwSections,),

                Column(
                  children: [
                    TSectionHeading(title: 'Sports shoes',onPressed: (){},),
                    SizedBox(height: TSizes.spaceBtwItems / 2,),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index) =>TProductCardHorizontal(),
                          separatorBuilder: (_,__) => SizedBox(width: TSizes.spaceBtwItems),
                          itemCount: 10),
                    )
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwSections,),

                Column(
                  children: [
                    TSectionHeading(title: 'Sports sneakers',onPressed: (){},),
                    SizedBox(height: TSizes.spaceBtwItems / 2,),
                    SizedBox(
                      height: 130,
                      child: ListView.separated(
                        shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_,index) =>TProductCardHorizontal(),
                          separatorBuilder: (_,__) => SizedBox(width: TSizes.spaceBtwItems),
                          itemCount: 10),
                    )
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwSections,),

              ],
            )
        ),
      ),
    );
  }
}
