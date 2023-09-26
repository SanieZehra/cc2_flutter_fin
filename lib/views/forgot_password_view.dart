import 'package:cc2_flutter_fin/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/forgot_controller.dart';
import '../utils/theme.dart';
import '../widgets/widgets.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  final controller=Get.put(ForgotPasswordController());
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.loginKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 8.0,right: 8.0,),
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                        width: 340,
                        child: Image.asset('assets/images/forgot2.gif',)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('We have you covered!',style: TextStyle(
                    fontSize: 25, color: Colors.black87,
                    fontFamily: 'MyCustomFont',
                    fontWeight: FontWeight.w800),),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Enter the email id for which you want to reset passsword",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16, color: Colors.black87,
                    fontFamily: 'MyCustomFont',
                    fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: customTextField(
                  textInputType: TextInputType.emailAddress,
                  inputAction: TextInputAction.done,
                  controller: controller.emailController1,
                  label: "Email",
                  obsecureText: true,
                  onValidate: (str){
                    return HelperFunctions.checkEmail(str);
                    },
                  focus: controller.emailFocusNode,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: customButton(
                    title: "Login",
                    onTap:(){ controller.forgotPassword();
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        final fabPosition = controller.fabPosition.value;
        return Positioned(
          left: fabPosition.dx,
          top: fabPosition.dy,
          child: Draggable(
            feedback: FloatingActionButton(
              onPressed: () {
                controller.sayHi();
              },
              child: Image.asset('assets/images/float.png'),
              backgroundColor: mainColor,
            ),
            child: FloatingActionButton(
              onPressed: () {
                controller.sayHi();
              },
              child: Image.asset('assets/images/float.png'),
              backgroundColor: mainColor,
            ),
            onDraggableCanceled: (_, offset) {
              controller.fabPosition.value = offset;
            },
            childWhenDragging: Container(),
          ),
        );
      }),
    );
  }
}
