import 'package:cc2_flutter_fin/controllers/success_controller.dart';
import 'package:cc2_flutter_fin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessView extends StatelessWidget {
  SuccessView({Key? key}) : super(key: key);
  final controller=Get.put(SuccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Image.asset('assets/images/checkout3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Image.asset('assets/images/icons.gif',height: 300,),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35,right: 35,top: 220),
            child: customButton(
                title: "Explore More!",
                onTap: (){
                  controller.updateValueInA();
                },
            ),
          )
        ],
      ),
    );
  }
}
