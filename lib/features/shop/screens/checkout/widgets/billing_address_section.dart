import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBIllingAddressSection extends StatelessWidget {
  const TBIllingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(title: "Shipping Address",buttonTitle: "Change",onPressed: (){},),
        Text("Seif Salman",style: Theme.of(context).textTheme.bodyLarge),

        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            Icon(Icons.phone,color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text("+20 10 63 031 253",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            Icon(Icons.location_city,color: Colors.grey,size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text("Helwan, Rayel, Cairo EG",style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

      ],
    );
  }
}
