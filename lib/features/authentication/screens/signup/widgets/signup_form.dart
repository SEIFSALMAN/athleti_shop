import 'package:athleti_shop/features/authentication/controllers/signup/signup_controller.dart';
import 'package:athleti_shop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:athleti_shop/features/authentication/screens/signup/widgets/signup_terms_and_conditions_checkbox.dart';
import 'package:athleti_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

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
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          ///First and Last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText("First Name", value),
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.firstName,
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              SizedBox(
                width: TSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText("Last Name", value),
                  controller: controller.lastName,
                  expands: false,
                  decoration: InputDecoration(
                      labelText: TTexts.lastName,
                      labelStyle: Theme.of(context).textTheme.labelSmall,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Username
          TextFormField(
            expands: false,
            controller: controller.userName,
            validator: (value) =>
                TValidator.validateEmptyText("Username", value),
            decoration: InputDecoration(
                labelText: TTexts.username, prefixIcon: Icon(Icons.person)),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Icons.email_outlined)),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            keyboardType: TextInputType.phone,
            validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Icons.call)),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Password
          Obx(
              ()=> TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              expands: false,
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  labelText: TTexts.password,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                  )),
            ),
          ),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          ///Terms and conditions
          TTermsAndConditionCheckbox(dark: dark),
          SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),

          /// Signup Buttons
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: Text(TTexts.createAccount)),
          )
        ],
      ),
    );
  }
}
