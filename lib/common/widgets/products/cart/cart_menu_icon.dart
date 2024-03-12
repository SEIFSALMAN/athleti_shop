
import 'package:athleti_shop/features/shop/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../utils/constants/colors.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,required this.iconColor, required this.onPressed,
  });

  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: ()=> Get.to(()=> CartScreen()),
            icon: Icon(
              Icons.shopping_cart,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(child: Text("2",style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: 0.8),)),
          ),
        )
      ],
    );
  }
}
