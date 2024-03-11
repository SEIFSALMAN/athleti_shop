import 'package:athleti_shop/common/styles/spacing_styles.dart';
import 'package:athleti_shop/features/authentication/screens/login/widgets/login_header.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeightAndNoBottom,
          child: Column(
            children: [
              /// Logo, Title and subTitle
              TLoginHeader(dark: dark),

              /// Form
              TLoginForm(),

              /// Divider
              TFormDivider(dark: dark,dividerText: TTexts.orSignInWith.capitalize!),
              SizedBox(height: TSizes.spaceBtwItems + 10,),
              /// Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}



