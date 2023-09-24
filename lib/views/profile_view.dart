import 'package:cc2_flutter_fin/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller=Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25,10,25,10),
              child: Container(
                height:150,
                width: 100,
                child: const CircleAvatar(
                  child: Icon(Icons.person,size: 80,)
                ),
              ),
            ),
          ),
          Obx(()=>Text("Registered Email: ${controller.email.value!}",style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              fontFamily: 'MyCustomFont'

          ),)),
        ],
      ),
    );
  }
}
