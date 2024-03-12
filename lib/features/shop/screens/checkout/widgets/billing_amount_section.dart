import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$256",style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),

        ///Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$5",style: Theme.of(context).textTheme.labelMedium,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),

        ///Taxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$25.6",style: Theme.of(context).textTheme.labelMedium,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),

        ///Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$285.6",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
      ],
    );
  }
}
