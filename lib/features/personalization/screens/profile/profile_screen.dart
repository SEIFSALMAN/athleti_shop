import 'package:athleti_shop/common/widgets/appbar/appbar.dart';
import 'package:athleti_shop/common/widgets/images/circular_image.dart';
import 'package:athleti_shop/common/widgets/texts/section_heading.dart';
import 'package:athleti_shop/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    TCircularImage(image: "assets/images/seif.jpg",width: 80,height: 80,),
                    TextButton(onPressed: (){}, child: Text("Change Profile Picture")),
                  ],
                ),
              ),
              SizedBox(height: TSizes.spaceBtwItems / 4,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),
              TSectionHeading(title: "Profile Information",showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(onPressed: (){}, title: 'Name', value: "Seif Salman"),
              TProfileMenu(onPressed: (){}, title: 'Username', value: "seifsalman"),

              SizedBox(height: TSizes.spaceBtwItems/ 1.5,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems / 2,),

              TSectionHeading(title: "Personal Information",showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems / 1.5,),

              TProfileMenu(onPressed: (){}, title: 'User ID', value: "45983",icon: Icons.copy),
              TProfileMenu(onPressed: (){}, title: 'Email', value: "seifxofficial@gmail.com"),
              TProfileMenu(onPressed: (){}, title: 'Phone Number', value: "01063031253"),
              TProfileMenu(onPressed: (){}, title: 'Gender', value: "Male"),
              TProfileMenu(onPressed: (){}, title: 'Date Of birth', value: "25 Apr, 2001"),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems / 2,),
              TextButton(onPressed: (){}, child: Text("Delete Account",style: TextStyle(color: Colors.red),))
            ],
          ),
        ),
      ),
    );
  }
}
