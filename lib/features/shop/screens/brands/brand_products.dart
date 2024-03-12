import 'package:athleti_shop/common/widgets/brands/brands_card.dart';
import 'package:athleti_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(height: TSizes.spaceBtwSections,),
              TSortableProducts()
            ],
          ),
        ),
      ),
    );
  }
}
