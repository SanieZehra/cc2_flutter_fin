import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordController extends GetxController{
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController  emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  final TextEditingController emailController1=TextEditingController();
  final FocusNode emailFocusNode=FocusNode();
  final GlobalKey<FormState> loginKey = GlobalKey();

  Rx<Offset> fabPosition = Offset(100.0, 100.0).obs;
  void updatePosition(Offset newPosition) {
    fabPosition.value = newPosition;
  }

  void initState() {
    // Initialize Flutter TTS
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(1.0);
    super.onInit();
  }

  Future<void> sayHi() async {
    await flutterTts.speak('Hello, I am Bubbles');
    print('Hi');
  }

  Future<void> forgotPassword() async {
    if(loginKey.currentState!.validate()){
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        'Password Reset',
        'Password reset email sent. Please check your inbox.',
        backgroundColor:Colors.green,
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
}}


