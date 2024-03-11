
import 'package:athleti_shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/device/device_utility.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() - 17,
        right: TSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () {
            OnBoardingController.instance.nextPage();
          },
          style: ElevatedButton.styleFrom(shape: CircleBorder(),backgroundColor: dark ? TColors.grey :  TColors.black),
          child: Icon(Icons.arrow_forward_ios_sharp,color: dark ? TColors.black : TColors.white),
        ));
  }
}
