import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text(TTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            SizedBox(height: TSizes.spaceBtwSections,),

            ///Buttons
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){} , child: Text(TTexts.done)),),
            SizedBox(height: TSizes.spaceBtwItems,),
            SizedBox(width: double.infinity, child: TextButton(onPressed: (){} , child: Text(TTexts.resendEmail)),),

          ],
        ),
      ),
    );
  }
}
