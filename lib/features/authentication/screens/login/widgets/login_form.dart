
import 'package:athleti_shop/features/authentication/controllers/login/login_controller.dart';
import 'package:athleti_shop/features/authentication/screens/password_configuration/forget_password_screen.dart';
import 'package:athleti_shop/features/authentication/screens/signup/signup_screen.dart';
import 'package:athleti_shop/navigation_menu.dart';
import 'package:athleti_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginKeyForm,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            ///Email
            TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  labelText: TTexts.email),
            ),
            SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),

            ///Password
            Obx(
            ()=> TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validateEmptyText('Password', value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                      onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    )),
              ),
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
                    Obx(
                      ()=> Checkbox(value: controller.rememberMe.value, onChanged: (value) {
                        controller.rememberMe.value = !controller.rememberMe.value;
                      }),
                    ),
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
                    onPressed: () => controller.emailAndPasswordSignIn(),
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