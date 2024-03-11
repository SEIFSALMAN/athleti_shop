import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:athleti_shop/common/widgets/icons/circular_icon.dart';
import 'package:athleti_shop/common/widgets/images/rounded_image.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/shop/screens/product_reviews/product_reviews_screen.dart';
import 'package:athleti_shop/features/shop/screens/products_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:athleti_shop/features/shop/screens/products_details/widgets/product_attributes.dart';
import 'package:athleti_shop/features/shop/screens/products_details/widgets/product_detail_image_slider.dart';
import 'package:athleti_shop/features/shop/screens/products_details/widgets/product_meta_data.dart';
import 'package:athleti_shop/features/shop/screens/products_details/widgets/rating_share_widget.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            TProductImageSlider(),

            ///Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Rating and share Button
                  TRatingAndShare(),

                  ///PRICE & TITLE & STOCK & BRAND
                  TProductMetaData(),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 1.5,
                  ),

                  ///ATTRIBUTES
                  TProductAttributes(),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///CHECKOUT BUTTON
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text("Checkout")),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///DESCRIPTION
                  TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "Show more",
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800,color: Colors.blue,decoration: TextDecoration.underline,decorationColor: Colors.blue),
                  ),

                  ///REVIEWS
                  Divider(),
                  SizedBox(height: TSizes.spaceBtwItems,),
                  GestureDetector(
                    onTap: ()=> Get.to(()=> ProductReviewsScreen()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TSectionHeading(title: 'Reviews (199)',showActionButton: false,),
                        IconButton(onPressed: ()=> Get.to(()=> ProductReviewsScreen()), icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwItems / 2,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
