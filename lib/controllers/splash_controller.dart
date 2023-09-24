import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    Timer(Duration(seconds: 5),() async {
      final prefs = await SharedPreferences.getInstance();
      String? email =prefs.getString(DbKeys.EMAIL);
      if(email!=null){
        Get.toNamed('/login');
      }else{
        Get.toNamed('/signup');
      }
    });
    super.onInit();
  }
}