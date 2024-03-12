import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/features/shop/screens/order/widgets/order_list.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        title: Text("My Orders",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderListItems(),
      ),
    );
  }
}
