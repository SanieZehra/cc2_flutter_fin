import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/db_keys.dart';

class CheckOutController extends GetxController {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController contactNumber = TextEditingController();

  //focus nodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode contactNumberFocusNode = FocusNode();

  RxBool obscureText = true.obs;

  Rx<IconData> suffixIcon = Icons.add.obs;

  final GlobalKey<FormState> loginKey = GlobalKey();


  Future<void> saveAndProceedOnClick() async {
    if (loginKey.currentState!.validate()) {
      var inputEmail = fullName.text.trim();
      var inputAddress = address.text.trim();
      var inputContactNumber = contactNumber.text.trim();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(DbKeys.NAME, inputEmail);
      await prefs.setString(DbKeys.ADDRESS, inputAddress);
      await prefs.setString(DbKeys.NUMBER, inputContactNumber);
      Get.toNamed('/ReviewDetails');
    }
  }
}