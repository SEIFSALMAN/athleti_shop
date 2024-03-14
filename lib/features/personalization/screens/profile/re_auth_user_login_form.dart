import 'package:athleti_shop/features/personalization/controllers/user_controller.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/popups/loaders.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,title: Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: TValidator.validateEmail,
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: TTexts.email),
                ),
                SizedBox(height: TSizes.spaceBtwInputFields,),
                Obx(
                      ()=> TextFormField(
                    controller: controller.verifyPassword,
                    validator: TValidator.validatePassword,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: IconButton(
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                          onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                        )),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(width: double.infinity,child: ElevatedButton(child: Text("Verify"),onPressed: () {
                  controller.reAuthenticateEmailAndPasswordUser();
                }),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
