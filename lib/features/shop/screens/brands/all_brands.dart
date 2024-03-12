import 'package:athleti_shop/common/widgets/brands/brands_card.dart';
import 'package:athleti_shop/common/widgets/layouts/grid_layout.dart';
import 'package:athleti_shop/common/widgets/products/sortable/sortable_products.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/shop/screens/brands/brand_products.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TAppBar(
          title: Text("Brands"),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                ///Heading
                TSectionHeading(title: 'Brands',showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems,),
                DropdownButtonFormField(
                    decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
                    value: 'Name',
                    items: ['Name','Higher Price','Lower Price','Sale','Newest','Popularity',].map((option) => DropdownMenuItem(value: option,child: Text(option))).toList(),
                    onChanged: (value){}
                ),
                SizedBox(height: TSizes.spaceBtwSections,),
                TGridLayout(
                    itemCount: 10,
                    mainAxisExtent: 80,
                    itemBuilder: (_,index)=> TBrandCard(showBorder: true,onTap: ()=> Get.to(()=> BrandProducts()),)
                )


                ///Brands

              ],
            ),
          ),
        )
    );
  }
}
