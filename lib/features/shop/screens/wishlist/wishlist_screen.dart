import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/icons/circular_icon.dart';
import 'package:athleti_shop/common/widgets/layouts/grid_layout.dart';
import 'package:athleti_shop/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:athleti_shop/features/shop/screens/home/home_screen.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(icon: Icons.add,onPressed: ()=> Get.to(HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 13, itemBuilder: (_,index) => TProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
