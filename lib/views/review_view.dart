import 'package:cc2_flutter_fin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';
import '../controllers/review_controller.dart';

class ReviewView extends StatelessWidget {
  ReviewView({Key? key}) : super(key: key);
  final controller=Get.put(ReviewController());
  final homeController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking Out',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.black87,),
            onPressed: () {
              Get.back();
            }),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Image.asset('assets/images/checkout2.png'),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>Text("SUBTOTAL: \$${homeController.subtotal.value!}",style:TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'MyCustomFont'

                ),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>Text("NAME: ${controller.name}",style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'MyCustomFont',
                    fontWeight: FontWeight.w800),),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>Text("CONTACT NUMBER: ${controller.contact}",style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'MyCustomFont',
                    fontWeight: FontWeight.w800),)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(()=>Text("ADDRESS: ${controller.address}",style: TextStyle(fontSize: 20,
                    color: Colors.black87,
                    fontFamily: 'MyCustomFont',
                    fontWeight: FontWeight.w800),)),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child:Image.asset('assets/images/map.png')),
              Padding(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
                child: customButton(
                    title: "Place Order",
                    onTap: (){
                      controller.placeOrder();
                      print(homeController.subtotal.value.obs);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
