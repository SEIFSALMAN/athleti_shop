import 'package:athleti_shop/features/shop/controllers/home_controller.dart';
import 'package:athleti_shop/utils/constants/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/container/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index),
              autoPlay: true,
              animateToClosest: true),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList()
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                    height: 5,
                    width: 20,
                    backgroundColor: controller.carousalCurrentIndex.value == i ? TColors.primary : TColors.grey,
                    margin: EdgeInsets.only(right: 10)),
            ],
          ),
        )
      ],
    );
  }
}
