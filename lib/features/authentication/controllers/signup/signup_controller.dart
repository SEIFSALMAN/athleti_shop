import 'package:athleti_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:athleti_shop/data/repositories/user/user_repository.dart';
import 'package:athleti_shop/features/authentication/models/user_model.dart';
import 'package:athleti_shop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:athleti_shop/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  ///Variables
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///SignUp
  void signup() async {
    try {

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (signupFormKey.currentState!.validate()){
        print('Working Good');
        // TFullScreenLoader.stopLoading();
      }
      else {
        print('Something wrongggg!');
        // TFullScreenLoader.stopLoading();

        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
            "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        return;
      }

      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "We are processing your information..",
          TImages.docerAnimation);

      //Register user into firebase and save his data in FireStore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
          email.text.trim(), password.text.trim());

      // Save Auth User data into FireStore
      final newUser = UserModel(id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //Remove Loader
      TFullScreenLoader.stopLoading();


      //Show Success message
      TLoaders.successSnackBar(title: "Congratulations",message: "Your acccount has been created! Verify email to continue");


      //Move to verify email Screen
      Get.to(()=>VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      // Show the error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      //  TFullScreenLoader.stopLoading();
    }
  }
}
