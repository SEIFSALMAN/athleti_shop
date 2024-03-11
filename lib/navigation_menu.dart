import 'package:athleti_shop/features/shop/screens/store/store_screen.dart';
import 'package:athleti_shop/features/shop/screens/wishlist/wishlist_screen.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/personalization/screens/settings/settings_screen.dart';
import 'features/shop/screens/home/home_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(()=> NavigationBar(
        height: 80,
          elevation: 0,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(CupertinoIcons.home), label: 'Home'),
            NavigationDestination(icon: Icon(CupertinoIcons.shopping_cart), label: 'Store'),
            NavigationDestination(icon: Icon(CupertinoIcons.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(CupertinoIcons.person), label: 'Profile'),
          ],
        ),),
      body: Obx (()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomeScreen(),StoreScreen(),WishlistScreen(),SettingsScreen(),];
}
