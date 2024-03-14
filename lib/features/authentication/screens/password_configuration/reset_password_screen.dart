import 'package:athleti_shop/features/authentication/screens/login/login_screen.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../controllers/forget_password/forget_password_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.back(), icon: Icon(CupertinoIcons.clear))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            ///Image With 60% Of Screen Width
            Image(image: AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth() * 0.6,),
            SizedBox(height: TSizes.spaceBtwSections,),
            ///Title & Subtitle
            Text(email,style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwSections,),

            ///Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.offAll(()=> LoginScreen()) , child: Text(TTexts.done)),),
            SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: TextButton(onPressed: ()=> controller.resendPasswordResetEmail(email), child: Text(TTexts.resendEmail)),),

          ],
        ),
      ),
    );
  }
}
