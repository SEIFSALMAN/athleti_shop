import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_functions.dart';
class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(title: 'Payment Method',buttonTitle: 'Change',onPressed: (){},),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(
                image: AssetImage(TImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
      ],
    );
  }
}
