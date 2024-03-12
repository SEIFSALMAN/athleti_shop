import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return ListView.separated(
      itemCount: 40,
      shrinkWrap: true,
      separatorBuilder: (_,__) => SizedBox(height: TSizes.spaceBtwItems),
        itemBuilder: (_,index) => TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          showBorder: true,
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ///Row 1
              Row(
                children: [
                  /// Icon
                  Icon(Iconsax.ship),
                  SizedBox(width:
                  TSizes.spaceBtwItems / 2,),
                  ///Status & Date
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Processing",style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary,fontWeightDelta: 1),),
                        Text("07 Apr 2024",style: Theme.of(context).textTheme.headlineSmall),
                      ],
                    ),
                  ),

                  ///Icon
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_rounded,size: TSizes.iconSm,))
                ],
              ),
              SizedBox(height: TSizes.spaceBtwItems,),
              ///Row 2
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        /// Icon
                        Icon(Iconsax.ship),
                        SizedBox(width:
                        TSizes.spaceBtwItems / 2,),
                        ///Status & Date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Order",style: Theme.of(context).textTheme.labelMedium),
                              Text('[256gd]',style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        /// Icon
                        Icon(Iconsax.ship),
                        SizedBox(width:
                        TSizes.spaceBtwItems / 2,),
                        ///Status & Date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Shipping Date",style: Theme.of(context).textTheme.labelMedium),
                              Text('25 Apr 2024',style: Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }
}
