import 'package:cc2_flutter_fin/controllers/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../controllers/checkout_controller.dart';
import '../widgets/widgets.dart';
import 'package:cc2_flutter_fin/utils/helper_functions.dart';

class CheckoutView extends StatelessWidget {
  CheckoutView({Key? key}) : super(key: key);
  final controller=Get.put(CheckOutController());
  final homeControl=Get.put(HomePageController());

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
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/checkout1.png'),
            ),
            Form(
              key: controller.loginKey,
              child: SafeArea(
                  child:Column(children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: Text("Please enter Details for Delivery",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'MyCustomFont'
                      ),),
                    ),
                    Container(
                      height: 65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child: customTextField(controller: controller.fullName,
                            onValidate: (str){
                              return HelperFunctions.checkPassword(str);
                            },
                            label: "Full Name",
                            focus: controller.fullNameFocusNode,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.name),
                      ),
                    ),
                    Container(
                      height: 65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child: customTextField(
                            onValidate:(str){
                              return HelperFunctions.checkPassword(str);
                            },
                            controller: controller.address,
                            label: "Complete Address",
                            obsecureText: false,
                            focus: controller.addressFocusNode,
                            inputAction: TextInputAction.next,
                            textInputType: TextInputType.text),
                      ),
                    ),
                    Container(
                      height: 65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                        child: customTextField(
                            controller: controller.contactNumber,
                            onValidate: (str){
                              return HelperFunctions.checkPassword(str);
                            },
                            label: "Contact Number",
                            obsecureText: false,
                            focus: controller.contactNumberFocusNode,
                            inputAction: TextInputAction.done,
                            textInputType: TextInputType.number),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
                      child: customButton(
                          title: "Continue",
                          onTap:(){ controller.saveAndProceedOnClick();
                          print("continue pressed");}
                      ),
                    ),
                  ],)


              ),
            ),
          ],
        ),
      ),
    );
  }
}
