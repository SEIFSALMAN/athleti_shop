import 'package:athleti_shop/common/widgets/success_screen/success_screen.dart';
import 'package:athleti_shop/features/authentication/screens/login/login_screen.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: ()=> Get.offAll(() => LoginScreen()), icon: Icon(CupertinoIcons.clear),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(TImages.deliveredEmailIllustration),width: THelperFunctions.screenWidth() * 0.6,height: 200),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Title & Subtitle
              Text(TTexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwItems,),
              Text("seifxofficial@gmail.com",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwItems,),
              Text(TTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
              SizedBox(height: TSizes.spaceBtwSections,),

              /// Buttons
              SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(()=> SuccessScreen(
                image: TImages.staticSuccessIllustration,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: ()=> Get.to(()=> LoginScreen()),
              )),child: Text(TTexts.tContinue)),),
              SizedBox(height: TSizes.spaceBtwItems,),
              SizedBox(width: double.infinity,child: TextButton(onPressed: (){},child: Text(TTexts.resendEmail)),),

            ],
          ),
        ),
      ),
    );
  }
}
