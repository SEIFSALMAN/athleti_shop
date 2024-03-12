import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:athleti_shop/common/widgets/success_screen/success_screen.dart';
import 'package:athleti_shop/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:athleti_shop/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:athleti_shop/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:athleti_shop/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:athleti_shop/navigation_menu.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text("Checkout",
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Items in cart
                TCartItems(
                  showAddRemoveButtons: false,
                ),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Coupon TextField
                TCouponCode(),
                SizedBox(
                  height: TSizes.spaceBtwSections,
                ),

                ///Billing
                TRoundedContainer(
                  showBorder: true,
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.black : TColors.white,
                  child: Column(
                    children: [
                      ///Pricing
                      TBillingAmountSection(),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),

                      ///Divider
                      Divider(),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),

                      ///Payment Methods
                      TBillingPaymentSection(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      ///Address
                      TBIllingAddressSection()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md, vertical: TSizes.xs),
          child: ElevatedButton(
              onPressed: () => Get.to(
                    () => SuccessScreen(
                      image: TImages.successfulPaymentIcon,
                      title: "Payment Success!",
                      subTitle: "Your Item will be shipped soon.",

                      ///Heading to Home Screen Again
                      onPressed: () => Get.offAll(
                        () => NavigationMenu(),
                      ),
                    ),
                  ),
              child: Text("Checkout \$1024")),
        ));
  }
}
