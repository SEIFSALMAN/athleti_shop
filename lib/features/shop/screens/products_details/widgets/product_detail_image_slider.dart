
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgesWidget(
        child: Container(
          color: dark ? TColors.darkerGrey : TColors.light,
          child: Stack(
            children: [
              ///Main Large Image
              SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child:
                      Image(image: AssetImage(TImages.productImage28))),
                ),
              ),

              ///Image Slider
              Positioned(
                right: 0,
                bottom: 30,
                left: TSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => TRoundedImage(
                        imageUrl: TImages.productImage20,
                        width: 80,
                        backgroundColor:
                        dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: EdgeInsets.all(TSizes.sm),
                      ),
                      separatorBuilder: (_, __) =>
                          SizedBox(width: TSizes.spaceBtwItems),
                      itemCount: 10),
                ),
              ),

              ///Appbar Icons
              TAppBar(
                showBackArrow: true,
                actions: [
                  TCircularIcon(icon: CupertinoIcons.heart,color: Colors.red,backgroundColor: Colors.transparent,)
                ],
              )
            ],
          ),
        ));
  }
}