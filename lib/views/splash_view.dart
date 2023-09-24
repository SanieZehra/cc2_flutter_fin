import 'package:cc2_flutter_fin/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatelessWidget {
  SplashView({Key? key}) : super(key: key);
  final controller=Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset('assets/images/splash.gif'),
      ),
    );
  }
}
