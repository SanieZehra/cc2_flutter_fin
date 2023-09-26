import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class SignUpController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //focus nodes
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode numberFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  RxBool obscureText = true.obs;

  Rx<IconData> suffixIcon = Icons.remove_red_eye_rounded.obs;

  final GlobalKey<FormState> loginKey = GlobalKey();


  Future<void> signUp() async {
    if (loginKey.currentState!.validate()) {
      var inputEmail = emailController.text.trim();
      var inputPassword = passwordController.text.trim();
      var inputConfirmPassword = confirmPasswordController.text.trim();
      if (inputPassword == inputConfirmPassword) {
        try {
          final credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(DbKeys.NAME, nameController.text);
          await prefs.setString(DbKeys.NUMBER, numberController.text);
          await prefs.setString(DbKeys.EMAIL, emailController.text);
          Get.toNamed('/login');
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar(
              'Weak Password',
              '',
              backgroundColor:CupertinoColors.destructiveRed,
              snackPosition: SnackPosition.TOP,
              colorText:Colors.white,
            );
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar(
              'This email is already in use.',
              '',
              backgroundColor:CupertinoColors.destructiveRed,
              snackPosition: SnackPosition.TOP,
              colorText:Colors.white,
            );
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      }
    }
  }

  void showPassword() {
    obscureText.value = !obscureText.value;
    suffixIcon.value = obscureText.value ? Icons.remove_red_eye_rounded : Icons.remove_red_eye_outlined;
  }
}