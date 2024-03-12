
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../icons/circular_icon.dart';

class TProductQuantityWithAddRemove extends StatelessWidget {
  const TProductQuantityWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(icon: CupertinoIcons.minus,width: 32,height: 32,backgroundColor: TColors.primary,color: TColors.white,size: TSizes.md,),
        SizedBox(width: TSizes.spaceBtwItems,),
        Text('2',style: Theme.of(context).textTheme.titleSmall,),
        SizedBox(width: TSizes.spaceBtwItems,),
        TCircularIcon(icon: CupertinoIcons.add,width: 32,height: 32,backgroundColor: TColors.primary,color: TColors.white,size: TSizes.md,),
      ],
    );
  }
}