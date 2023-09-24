import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class ReviewController extends GetxController {
  Rx<String> name = ''.obs;
  Rx<String> address = ''.obs;
  Rx<String> contact = ''.obs;

  @override
  void onInit(){
    getDetails();
    super.onInit();
  }

  getDetails() async{
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString(DbKeys.NAME) ?? 'STATIC';
    address.value = prefs.getString(DbKeys.ADDRESS) ?? 'STATIC';
    contact.value = prefs.getString(DbKeys.NUMBER) ?? 'STATIC';
  }

  placeOrder(){
    Get.toNamed('/success');
  }
}