import 'package:athleti_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:athleti_shop/data/repositories/user/user_repository.dart';
import 'package:athleti_shop/features/authentication/models/user_model.dart';
import 'package:athleti_shop/features/authentication/screens/login/login_screen.dart';
import 'package:athleti_shop/features/personalization/screens/profile/re_auth_user_login_form.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/constants/sizes.dart';
import 'package:athleti_shop/utils/popups/full_screen_loader.dart';
import 'package:athleti_shop/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final imageUploading = false.obs;
  final hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  ///Fetch User Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //Refresh user record
      await fetchUserRecord();


      if(user.value.id.isEmpty){
      if (userCredential != null) {
        // Split name into First and Last name
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? "");

        //Map Data
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(" ") : '',
            username: username,
            email: userCredential.user!.email ?? "",
            phoneNumber: userCredential.user!.phoneNumber ?? "",
            profilePicture: userCredential.user!.photoURL ?? "");

        // Save user data
        await userRepository.saveUserRecord(user);
       }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message:
              "Something went wrong while saving your informations. You can re-save your data in your Profile.");
    }
  }

  ///Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      titlePadding: EdgeInsets.only(top: 30),
      contentPadding: EdgeInsets.all(TSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently",
      confirm: SizedBox(
        height: 54,
        child: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
            child: Text('Delete'),
          ),
        ),
      ),
      cancel: SizedBox(height: 54,child: OutlinedButton(onPressed: ()=> Navigator.of(Get.overlayContext!).pop(), child: Text('Cancel')))
    );
  }

  ///Delete User Account
  void deleteUserAccount() async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(()=>LoginScreen());
        }
          else if(provider == 'password') {
            TFullScreenLoader.stopLoading();
            Get.to(()=> ReAuthLoginForm());
        }
      }
    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }

  ///Re Auth before Deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (!reAuthFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(),verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: "Deleted successfully.",message: "Your account have been deleted permanently");


      //Move to verify email Screen
      Get.offAll(()=> LoginScreen());

    } catch(e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  ///Upload Profile image to FireStorage
  uploadUserProfilePicture() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 90,maxHeight: 512,maxWidth: 512);
      if(image != null){
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);

        // Update user Image Record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(title: "Congrats",message: "Your profile image has been updated.");
      }
    } catch(e){
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }
}
