import 'package:athleti_shop/common/widgets/icons/circular_icon.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace , vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg)
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              TCircularIcon(icon: CupertinoIcons.minus,backgroundColor: TColors.darkGrey,width: 40,height: 40,color: TColors.white,),
              SizedBox(width: TSizes.spaceBtwItems,),
              Text('2',style: Theme.of(context).textTheme.titleSmall,),
              SizedBox(width: TSizes.spaceBtwItems,),
              TCircularIcon(icon: CupertinoIcons.add,backgroundColor: TColors.darkGrey,width: 40,height: 40,color: TColors.white,),
            ],
          ),
          ElevatedButton(onPressed: (){}, child: Text("Add to Cart"),style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(TSizes.md),
            backgroundColor: TColors.black,
            side: BorderSide(color: TColors.black)
          ),)
        ],
      ),
    );
  }
}
