
import 'package:athleti_shop/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(top: TDeviceUtils.getAppBarHeight() * 0.8,right: TSizes.defaultSpace * 0.5,child: TextButton(onPressed: ()=>OnBoardingController.instance.skipPage(),child: Text("Skip"),));
  }
}
