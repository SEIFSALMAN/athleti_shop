import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/appbar/tabbar.dart';
import 'package:athleti_shop/common/widgets/custom_shapes/container/search_container.dart';
import 'package:athleti_shop/common/widgets/layouts/grid_layout.dart';
import 'package:athleti_shop/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/shop/screens/brands/all_brands.dart';
import 'package:athleti_shop/features/shop/screens/store/widgets/category_tab.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../../common/widgets/brands/brands_card.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: dark ? TColors.black : TColors.white,

        ///AppBar
        appBar: TAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              onPressed: () {},
              iconColor: dark ? TColors.white : TColors.black,
            )
          ],
        ),

        ///Header
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: dark ? TColors.black : TColors.white,
                  expandedHeight: 400,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace - 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        ///Search Bar
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TSearchContainer(
                          text: 'Search in Store..',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),

                        ///Featured Brands
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        TSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () => Get.to(()=> AllBrandsScreen()),
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),

                        /// Brands GRID
                        TGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              return TBrandCard(
                                showBorder: false,
                              );
                            })
                      ],
                    ),
                  ),

                  ///Tabs
                  bottom: TTabBar(
                    tabs: [
                      Tab(
                        child: Text("Sports"),
                      ),
                      Tab(
                        child: Text("Furniture"),
                      ),
                      Tab(
                        child: Text("Electronics"),
                      ),
                      Tab(
                        child: Text("Clothes"),
                      ),
                      Tab(
                        child: Text("Cosemtics"),
                      ),
                    ],
                  )),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
