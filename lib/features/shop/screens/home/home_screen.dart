import 'package:athleti_shop/common/widgets/layouts/grid_layout.dart';
import 'package:athleti_shop/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:athleti_shop/features/shop/screens/home/widgets/home_categories.dart';
import 'package:athleti_shop/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/container/search_container.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                ///AppBar
                THomeAppBar(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                /// SearchBar
                TSearchContainer(
                  text: "Search in Store..",
                  icon: CupertinoIcons.search,
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Categories
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(children: [
                    /// Heading
                    TSectionHeading(
                      title: 'Popular Categories',
                      showActionButton: false,
                      textColor: Colors.white,
                      onPressed: (){},
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    ///Categories
                    THomeCategories(),
                    SizedBox(height: TSizes.spaceBtwSections,),




                  ]),
                )
              ],
            ),),


            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.productImage1,
                      TImages.productImage7,
                      TImages.productImage8
                    ],
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(title: "Popular Products",showActionButton: true,),
                  ///Popular Products
                  TGridLayout(itemCount: 19, itemBuilder: (_,index) => TProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
