import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/container/rounded_container.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? TColors.primary.withOpacity(0.5) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? TColors.darkerGrey : TColors.lightGrey,
      margin: EdgeInsets.only(
        bottom: TSizes.spaceBtwItems,
      ),
      child: Stack(
        children: [
          Positioned(right: 5,top:0,child: Icon(selectedAddress ? Iconsax.tick_circle5 : null ,color: selectedAddress ? dark ? TColors.light : TColors.dark : null,)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Seif Salman",maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
              SizedBox(height: TSizes.sm / 2,),
              Text("(+20) 10 630 31 253"),
              SizedBox(height: TSizes.sm / 2,),
              Text("1 Adham Street, Beside Rayel street, Helwan, Cairo, EG",softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
}
