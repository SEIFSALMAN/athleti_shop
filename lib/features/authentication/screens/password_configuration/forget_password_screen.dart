import 'package:athleti_shop/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Headings
            Text(TTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: TSizes.spaceBtwItems,),
            Text(TTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium,),
            SizedBox(height: TSizes.spaceBtwSections * 2,),

            /// Text Field
            TextFormField(
              decoration: InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Icons.send)
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections,),

            /// Submit Button
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.off(()=> ResetPasswordScreen()), child: Text(TTexts.submit)))
          ],
        ),
      ),
    );
  }
}
