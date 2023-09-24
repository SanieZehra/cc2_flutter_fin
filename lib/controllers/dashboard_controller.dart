import 'package:cc2_flutter_fin/views/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../views/cart_view.dart';
import '../views/categories.dart';
import '../views/homepage_view.dart';
import '../views/profile_view.dart';

class DashboardController extends GetxController {
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