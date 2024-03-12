import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_quantity_product.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      separatorBuilder: (_, __) =>
          SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,

      shrinkWrap: true,
      itemBuilder: (_, index) => Column(
        children: [
          ///Cart Item
          TCartItem(dark: dark),
          if(showAddRemoveButtons) SizedBox(height: TSizes.spaceBtwItems,),

                  ///Add or Remove buttons
          if(showAddRemoveButtons)
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 85,),
                  TProductQuantityWithAddRemove(),
                ],
              ),

              TProductPriceText(price: '256')
            ],
          )
        ],
      ),
    );
  }
}
