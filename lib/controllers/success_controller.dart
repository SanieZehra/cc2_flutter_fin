import 'package:cc2_flutter_fin/views/dashboard_view.dart';
import 'package:get/get.dart';

import 'homepage_controller.dart';

class SuccessController extends GetxController{

  void updateValueInA() {
    HomePageController controllerHome = Get.put(HomePageController());
    controllerHome.subtotal.value=(0.0).obs();
    controllerHome.cartItems.length=0;
    controllerHome.cartCount.value=0;
    Get.toNamed('/homepage');
  }
}