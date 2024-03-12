import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/icons/circular_icon.dart';
import 'package:athleti_shop/common/widgets/images/rounded_image.dart';
import 'package:athleti_shop/common/widgets/texts/brand_title_with_verified_icon.dart';
import 'package:athleti_shop/common/widgets/texts/product_price_text.dart';
import 'package:athleti_shop/common/widgets/texts/product_title_text.dart';
import 'package:athleti_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:athleti_shop/features/shop/screens/checkout/checkout.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/widgets/products/cart/add_remove_quantity_product.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md,vertical: TSizes.xs),
        child: ElevatedButton(onPressed: ()=> Get.to(()=> CheckoutScreen()),child: Text("Checkout \$1024")),
      ),
    );
  }
}


