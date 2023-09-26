import 'dart:ui';

import 'package:cc2_flutter_fin/views/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/cart_view.dart';
import '../views/categories.dart';
import '../views/homepage_view.dart';
import '../views/profile_view.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DashboardController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
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
  RxInt selectedIndex = 0.obs;
  RxList names = ['Home', 'Cart', 'Categories', 'Profile', 'Settings'].obs;
  RxList pages = [
    HomepageView(),
    CartView(),
    ExplorePage(),
    ProfileView(),
    SettingsView()
  ].obs;

  navIndex(int index) {
    selectedIndex.value = index;
  }


  Future<void> emailSignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.toNamed('/login');
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}