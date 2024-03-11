
import 'package:athleti_shop/features/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:athleti_shop/features/authentication/screens/signup/signup_screen.dart';
import 'package:athleti_shop/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  labelText: TTexts.email),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///Password
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: TTexts.password,
                  suffixIcon: Icon(Icons.remove_red_eye)),
            ),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// Remember Me & Forget
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(TTexts.rememberMe)
                  ],
                ),

                /// Forget Password
                TextButton(
                    onPressed: () => Get.to(()=> ForgetPasswordScreen()),
                    child: Text(TTexts.forgetPassword,style: TextStyle(color: Colors.blue),))
              ],
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            ///Sign in Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(()=> NavigationMenu()),
                    child: Text(TTexts.signIn))),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Create account button
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => Get.to(()=> SignupScreen()),
                    child: Text(TTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}