
import 'package:banner_carousel/banner_carousel.dart';
import 'package:cc2_flutter_fin/utils/theme.dart';
import 'package:cc2_flutter_fin/views/product_detail_view.dart';
import 'package:cc2_flutter_fin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageView extends StatelessWidget {
  HomepageView({Key? key}) : super(key: key);
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
            () => controller.isLoading.value
            ? const Center(child:  CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: BannerCarousel(banners: BannerImages.listBanners,
                        onTap: (id) => print(id),
                        activeColor: mainColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: Container(
                      child: Column(
                          children: [
                            Row(
                              children: [
                                categoryButton(
                                    title: "TOPS",
                                    imageAsset: "assets/images/1.png",
                                    backgroundColor: Colors.grey.shade100,
                                    onPressed: (){}),
                                const SizedBox(width: 10),
                                categoryButton(
                                    title: "BOTTOMS",
                                    onPressed: (){},
                                backgroundColor: mainColor,
                                  imageAsset: "assets/images/2.png",
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                categoryButton(
                                    title: "ACCESSORIES",
                                    backgroundColor: mainColor,
                                    imageAsset: "assets/images/3.png",
                                    onPressed: (){}),
                                const SizedBox(width: 10),
                                categoryButton(
                                    imageAsset: "assets/images/4.png",
                                    backgroundColor: Colors.grey.shade100,
                                    title: "OTHERS",
                                    onPressed: (){}),
                              ],
                            ),
                          ],),
                    ),
                    ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10,left: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("ALL PRODUCTS",style:TextStyle(decorationColor: Colors.black, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'MyCustomFont',
                      ),
                        textAlign: TextAlign.left,
                      ),
                    )
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.products.value.length,
                      itemBuilder: (context, int index) {
                        return Container(
                          height: 140,
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Card(
                            color: Color(0xffffffff),
                            child: Center(
                              child: ListTile(
                                onTap: (){
                                  {Get.to(() => ProductDetailPage(product: controller.products.values.toList()[index]));}
                                },
                                title: Text(
                                  '${controller.products.values.toList()[index].title}',
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'MyCustomFont'),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2// Change text color
                                ),
                                subtitle: Text(
                                  'Price: ${controller.products.values.toList()[index].price}',
                                  style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'MyCustomFont',fontWeight: FontWeight.w500) // Change text color
                                ),
                                leading: Container(
                                  width: 70,
                                  height: 100,
                                  child: Image.network(controller.products.values.toList()[index].image),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    controller.onCartClick(controller.products.values.toList()[index]);
                                    controller.cartCount++;
                                  },
                                  icon: const Icon(Icons.add_box_rounded, color: Color(0xffc68017),size: 30), // Change icon color
                                  // Replace with your desired icon
                                  // You can also customize the icon, e.g., Icon(Icons.edit),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),]),
      ),
            ),
    );
  }
}
