import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController{
  final TextEditingController  emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  Future<void> resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        'Password Reset',
        'Password reset email sent. Please check your inbox.',
        backgroundColor:CupertinoColors.systemGreen,
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      Get.snackbar(
        'Password Reset Failed',
        e.toString(),
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}


