import 'package:cc2_flutter_fin/controllers/homepage_controller.dart';
import 'package:cc2_flutter_fin/views/cart_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';


class MainDashboard extends StatelessWidget {
  MainDashboard({Key? key}) : super(key: key);
  DashboardController controller=Get.put(DashboardController());
  HomePageController homeController=Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffc68017),
          toolbarHeight: 100,
          elevation: 14,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70))),
            title: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Obx(() => Text(
                    controller.names[controller.selectedIndex.value],
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
                ],
              ),
            ),
          actions: [
            Row(
              children: [
                InkWell(
                  onTap: () {Get.to(CartView());},
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          height: 35,
                          width: 35,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                          child: const Icon(
                            color: Color(0xffc68017),
                            size: 20,
                            Icons.shopping_cart),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 15,
                          ),
                          child: Center(
                            child: Obx(() => Text(homeController.cartCount.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            ),
                          ),
                        ),
                      )],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.emailSignOut();
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.logout, size: 20, color: Color(0xffc68017)),
                  ),
                ),
                const SizedBox(width: 26,)],
            )],),
        body: Obx(() => controller.pages[controller.selectedIndex.value]),
        bottomNavigationBar: Obx(() => ConvexAppBar(
          style: TabStyle.fixedCircle,
          height: 60,
          cornerRadius: 30,
          backgroundColor: const Color(0xffc68017),
          activeColor: Colors.white,
          items: const [
            TabItem(icon: Icons.home,title: 'Home'),
            TabItem(icon: Icons.shopping_cart,title: 'Cart'),
            TabItem(icon: Icons.category,title: 'Categories'),
            TabItem(icon: Icons.account_box,title: 'Profile'),
            TabItem(icon: Icons.settings,title: 'Settings'),
          ],
          initialActiveIndex: controller.selectedIndex.value,
          onTap: controller.navIndex,
        ),)
    );
  }
}

