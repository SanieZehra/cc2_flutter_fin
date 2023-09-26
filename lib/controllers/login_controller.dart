import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class LoginScreenController extends GetxController{
  final GlobalKey<FormState> loginKey = GlobalKey();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController confirmPasswordController=TextEditingController();
  //focus nodes
  final FocusNode emailFocusNode=FocusNode();
  final FocusNode passwordFocusNode=FocusNode();
  final FocusNode confirmPasswordFocusNode=FocusNode();

  RxBool obscureText = true.obs;

  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;

  Future<void> login() async {
    if(loginKey.currentState!.validate()){
      try {
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text
        );
        if(credential != null) {
          final prefs = await SharedPreferences.getInstance();
          String? email=prefs.getString(DbKeys.EMAIL);
          print(">>>>>>>>${email}");
          if(email!=null){
            print(email);
            Get.offNamed('/dashboard');
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar(
              'User Not Found',
              '',
              backgroundColor:CupertinoColors.destructiveRed,
              snackPosition: SnackPosition.TOP,
              colorText:Colors.white,
              duration: Duration(seconds: 3)
          );
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
              'Wrong Password',
              '',
              backgroundColor:CupertinoColors.destructiveRed,
              snackPosition: SnackPosition.TOP,
              colorText:Colors.white,
              duration: Duration(seconds: 3)
          );
          print('Wrong password provided for that user.');
        }
      }
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // User canceled the sign-in
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;
      Get.toNamed('/dashboard');
      return user;
    } catch (e) {
      print("Error during sign-in: $e");
      Fluttertoast.showToast(
        msg: "Sign-In Failed. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return null;
    }
  }

  onForgotPassword(){
    Get.toNamed('/forgotPassword');
  }

  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }

}

