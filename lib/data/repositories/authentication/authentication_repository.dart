import 'package:athleti_shop/features/authentication/screens/login/login_screen.dart';
import 'package:athleti_shop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  
  ///VARIABLES
  final deviceStorage = GetStorage();
  
  ///CALLED FROM MAIN.DART ON LAUNCH
  @override
  void onReady(){
    FlutterNativeSplash.remove();
    screenRedirect();
  }
  
  /// SHOWING RELEVANT SCREEN
  void screenRedirect() async {
    // Local Storage
    if(kDebugMode){
      print('=================GET STORAGE Repo====================');
      print(deviceStorage.read('isFirstTime'));
    }

    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(()=> LoginScreen()) : Get.offAll(()=> OnBoardingScreen());
  }
  
  /*------------------------------------  Email & Password Sign-In  -------------------------------------------------------*/


}