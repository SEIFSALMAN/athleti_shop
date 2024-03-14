import 'package:athleti_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:athleti_shop/data/repositories/user/user_repository.dart';
import 'package:athleti_shop/features/authentication/models/user_model.dart';
import 'package:athleti_shop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:athleti_shop/features/personalization/controllers/user_controller.dart';
import 'package:athleti_shop/utils/helpers/network_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  ///Variables
  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginKeyForm = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///Sign in with Email and Password
  void emailAndPasswordSignIn() async {
    try {
      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (loginKeyForm.currentState!.validate()){
        print('Working Good');
        // TFullScreenLoader.stopLoading();
      }
      else {
        print('Something wrongggg!');
        // TFullScreenLoader.stopLoading();

        return;
      }

      //Start Loading
      TFullScreenLoader.openLoadingDialog(
          "Logging you in...",
          TImages.docerAnimation);

      // Save Data if Remember me is chosen
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      } else {
        localStorage.remove('REMEMBER_ME_EMAIL');
        localStorage.remove('REMEMBER_ME_PASSWORD');
      }

      // Login user using email and pass auth.
      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //Remove Loader
      TFullScreenLoader.stopLoading();


      //Show Success message
      TLoaders.successSnackBar(title: "Welcome back",message: "Welcome back we missed you.");


      //Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Show the error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove Loader
      //  TFullScreenLoader.stopLoading();
    }
  }

  /// Sign in with Google
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog("Logging you in...", TImages.docerAnimation);

      //Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google Auth
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //Save User Record
      await userController.saveUserRecord(userCredentials);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
