import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/constants/text_strings.dart';
import 'package:athleti_shop/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/update_name_controller.dart';
class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Change Name",style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("User a real name for easy verifications, This name will appear on several pages.",style: Theme.of(context).textTheme.labelMedium),
            SizedBox(height: TSizes.spaceBtwSections,),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value)=> TValidator.validateEmptyText("First Name", value),
                    expands: false,
                    decoration: InputDecoration(labelText: TTexts.firstName , prefixIcon: Icon(Iconsax.user)),
                  ),
                  SizedBox(height: TSizes.spaceBtwInputFields,),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value)=> TValidator.validateEmptyText("Last Name", value),
                    expands: false,
                    decoration: InputDecoration(labelText: TTexts.lastName , prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=> controller.updateUserName(),child: Text("Save")),)
          ],
        ),
      ),
    );
  }
}
