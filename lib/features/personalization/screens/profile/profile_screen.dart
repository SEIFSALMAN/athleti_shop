import 'package:athleti_shop/common/styles/shimmer.dart';
import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/images/circular_image.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/personalization/controllers/user_controller.dart';
import 'package:athleti_shop/features/personalization/screens/profile/change_name_screen.dart';
import 'package:athleti_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                     () {
                       final networkImage = controller.user.value.profilePicture;
                       final image = networkImage.isNotEmpty ? networkImage : TImages.user;

                       return controller.imageUploading.value ?TShimmerEffect(width: 80, height: 80,radius: 80,) : TCircularImage(
                        image: image,
                        isNetworkImage: networkImage.isNotEmpty,
                        width: 80,
                        height: 80,
                      );
                     },
                    ),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: Text("Change Profile Picture")),
                  ],
                ),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 4,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TProfileMenu(
                  onPressed: () => Get.to(() => ChangeNameScreen()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Username',
                  value: controller.user.value.username),
              SizedBox(
                height: TSizes.spaceBtwItems / 1.5,
              ),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems / 1.5,
              ),
              TProfileMenu(
                  onPressed: () => Clipboard.setData(
                        ClipboardData(text: controller.user.value.id),
                      ),
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Icons.copy),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Email',
                  value: controller.user.value.email),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: "Male"),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Date Of birth',
                  value: "25 Apr, 2001"),
              Divider(),
              SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
