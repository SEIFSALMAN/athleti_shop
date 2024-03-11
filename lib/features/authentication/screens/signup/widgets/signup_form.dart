
import 'package:athleti_shop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:athleti_shop/features/authentication/screens/signup/widgets/signup_terms_and_conditions_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          ///First and Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.firstName,
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              SizedBox(width: TSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.lastName,
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),

            ],
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),
          //
          // /// Username
          // TextFormField(
          //   expands: false,
          //   decoration: InputDecoration(
          //       labelText: TTexts.username,
          //       prefixIcon: Icon(Icons.person)),
          // ),
          // SizedBox(height: TSizes.spaceBtwInputFields,),

          /// Email
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Phone Number
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.phoneNo,
                prefixIcon: Icon(Icons.call)),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),

          /// Password
          TextFormField(
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye)
            ),
          ),
          SizedBox(height: TSizes.spaceBtwInputFields,),

          ///Terms and conditions
          TTermsAndConditionCheckbox(dark: dark),
          SizedBox(height: TSizes.spaceBtwInputFields,),

          /// Signup Buttons
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> Get.to(()=> VerifyEmailScreen()),child: Text(TTexts.createAccount)),)
        ],
      ),
    );
  }
}