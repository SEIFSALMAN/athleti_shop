import 'package:athleti_shop/common/widgets/login_signup/social_buttons.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: TSizes.spaceBtwSections + 25),

              /// Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Form
              SignupForm(dark: dark),
              SizedBox(height: TSizes.spaceBtwSections),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!,dark: dark,),
              SizedBox(height: TSizes.spaceBtwItems),

              ///Social Buttons
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

