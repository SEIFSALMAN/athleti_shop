import 'package:athleti_shop/data/repositories/user/user_repository.dart';
import 'package:athleti_shop/features/authentication/screens/login/login_screen.dart';
import 'package:athleti_shop/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:athleti_shop/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:athleti_shop/navigation_menu.dart';
import 'package:athleti_shop/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:athleti_shop/utils/exceptions/firebase_exceptions.dart';
import 'package:athleti_shop/utils/exceptions/format_exceptions.dart';
import 'package:athleti_shop/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///VARIABLES
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Auth user data
  User? get authUser => _auth.currentUser;

  ///CALLED FROM MAIN.DART ON LAUNCH
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// SHOWING RELEVANT SCREEN
  void screenRedirect() async {
    final user = _auth.currentUser;
    // Local Storage
    if (kDebugMode) {
      print('=================GET STORAGE Repo====================');
      print("Is First Time: ${deviceStorage.read('isFirstTime')}");
      print("User: ${user}");
      print("Email: ${deviceStorage.read('REMEMBER_ME_EMAIL')}");
      print("Pass: ${deviceStorage.read('REMEMBER_ME_PASSWORD')}");
    }


    if(user != null){
      if(user.emailVerified){
        Get.offAll(()=>NavigationMenu());
       }
      else {
        Get.offAll(()=> VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    }
      else {
        deviceStorage.writeIfNull('isFirstTime', true);
        deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(() => OnBoardingScreen());
    }
  }



/*------------------------------------  Email & Password Sign-In  -------------------------------------------------------*/

///[EMAIL_AUTH] - SignIn
  Future<UserCredential> loginWithEmailAndPassword(String email,String password) async {
    try{
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }

  }

  ///[EMAIL_AUTH] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email,String password) async {
  try{
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again!';
  }

}

///[EMAIL_AUTH] - MAIL VERIFY
  Future<void> sendEmailVerification() async {
  try{
    await _auth.currentUser?.sendEmailVerification();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e){
    throw TFirebaseException(e.code).message;
  } on FormatException catch(_) {
    throw TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again!';
  }
}

///[EMAIL_AUTH] - ReAuth  User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

///[EMAIL_AUTH] - FORGET PASS
  Future<void> sendPasswordResetEmail(String email) async {
    try{
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }

///[EMAIL_AUTH] - DELETE USER - Remove user Auth and Firestore Account
  Future<void> deleteAccount() async {
    try{
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }



  /*------------------------------------ Social Sign In  -------------------------------------------------------*/

///[Google_AUTH] - Google
    Future<UserCredential?> signInWithGoogle() async {
     try{
       //Trigger auth flow
       final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

       //Obtain auth details from req.
       final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

       // Create a new credentials
       final credentials = GoogleAuthProvider.credential(
         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken
       );

       // Once signed in, return the UserCredentials
       return await _auth.signInWithCredential(credentials);


     } on FirebaseAuthException catch (e) {
       throw TFirebaseAuthException(e.code).message;
     } on FirebaseException catch (e){
       throw TFirebaseException(e.code).message;
     } on FormatException catch(_) {
       throw TFormatException();
     } on PlatformException catch (e) {
       throw TPlatformException(e.code).message;
     } catch (e) {
       throw 'Something went wrong. Please try again!';
     }
   }

///[Facebook_AUTH] - Facebook
 /*------------------------------------ Logout and Remove or DELETE  -------------------------------------------------------*/

///[LOGOUTUSER] - Valid for any auth!
  Future<void> logout() async {
    try{
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=>LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again!';
    }
  }


///[Facebook_AUTH] - Facebook


}
