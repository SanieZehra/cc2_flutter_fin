import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class ProfileController extends GetxController{
  Rx<String> email = ''.obs;

  @override
  void onInit(){
    getDetails();
    super.onInit();
  }

  getDetails() async{
    final prefs = await SharedPreferences.getInstance();
    email.value = prefs.getString(DbKeys.EMAIL) ?? 'Sorry, No Info Found!';
  }

}