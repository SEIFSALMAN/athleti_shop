import 'package:athleti_shop/data/repositories/authentication/authentication_repository.dart';
import 'package:athleti_shop/features/authentication/screens/password_configuration/reset_password_screen.dart';
import 'package:athleti_shop/utils/constants/image_strings.dart';
import 'package:athleti_shop/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instace => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  ///Send Reset Password Email
  sendPasswordResetEmail()async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing your request..", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form Validation
      if (forgetPasswordFormKey.currentState!.validate()){
        print('Working Good');
        TFullScreenLoader.stopLoading();
      }
      else {
        print('Something wrongggg!');
        TFullScreenLoader.stopLoading();

        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      //Show Success message
      TLoaders.successSnackBar(title: "Email Sent.",message: "Email link sent to Reset your password!.".tr);

      //Move to verify email Screen
      Get.to(()=>ResetPasswordScreen(email: email.text.trim(),));
    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }

  /// Resend it
  resendPasswordResetEmail(String email)async{
    try{
      TFullScreenLoader.openLoadingDialog("Processing your request..", TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      //Show Success message
      TLoaders.successSnackBar(title: "Email Sent.",message: "Email link sent to Reset your password!.".tr);

    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }

  }

}