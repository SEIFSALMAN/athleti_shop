import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/personalization/screens/address/address_screen.dart';
import 'package:athleti_shop/features/shop/screens/cart/cart_screen.dart';
import 'package:athleti_shop/features/shop/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../common/widgets/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../profile/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header

            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text("Account",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white)),
                  ),
                  TUserProfileTile(
                      onPressed: () => Get.to(() => ProfileScreen())),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Settings
                  TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingsMenuTile(
                    icon: Icons.gps_fixed_rounded,
                    title: "My Addresses",
                    subTitle: "Set shopping delivery address",
                    onTap: () => Get.to(()=> UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.shopping_cart,
                    title: "My Cart",
                    subTitle: "Add, remove products and move to checkout",
                    onTap: () => Get.to(()=> CartScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.shopping_bag,
                    title: "My Orders",
                    subTitle: "In-progress and completed orders",
                    onTap: () => Get.to(()=> OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.comment_bank_sharp,
                    title: "Bank Account",
                    subTitle: "Withdraw balance to registered bank account",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.discount,
                    title: "My Coupons",
                    subTitle: "List of all of discounted coupons",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.notifications,
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Icons.security,
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                    onTap: () {},
                  ),

                  /// App Settings
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingsMenuTile(
                    icon: Icons.document_scanner,
                    title: "Load Data",
                    subTitle:
                        "Upload data to your Cloud Firebase and Firestore",
                  ),
                  TSettingsMenuTile(
                      icon: Icons.location_history,
                      title: "Geolocation",
                      subTitle: "Set recommendation based on location"),
                  TSettingsMenuTile(
                    icon: Icons.document_scanner,
                    title: "Safe Mode",
                    subTitle: "Search result is safe for all ages",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingsMenuTile(
                    icon: Icons.document_scanner,
                    title: "HD Image Quality",
                    subTitle: "Set image quality to be seen",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),

                  ///Logout Button
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text("Logout"),
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
