import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/signup_controller.dart';
import '../widgets/widgets.dart';
import 'package:cc2_flutter_fin/utils/helper_functions.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final controller=Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Form(
          key: controller.loginKey,
          child: SafeArea(
            child:Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: Image.asset('assets/images/blackLogo.png',height: 200),
              ),
              Container(
                height: 65,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: customTextField(controller: controller.nameController,
                      onValidate: (str){
                    return HelperFunctions.checkPassword(str);
                },
                      label: "Name",
                      focus: controller.nameFocusNode,
                      inputAction: TextInputAction.next,
                      textInputType: TextInputType.name),
                ),
              ),
              Container(
                height: 65,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: customTextField(controller: controller.numberController,
                      onValidate: (str){
                        return HelperFunctions.checkPassword(str);
                      },
                      label: "Contact Number",
                      focus: controller.numberFocusNode,
                      inputAction: TextInputAction.next,
                      textInputType: TextInputType.number),
                ),
              ),
              Container(
                height: 65,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: customTextField(controller: controller.emailController,
                      onValidate: (str){
                        return HelperFunctions.checkPassword(str);
                      },
                      label: "Email",
                      focus: controller.emailFocusNode,
                      inputAction: TextInputAction.next,
                      textInputType: TextInputType.emailAddress),
                ),
              ),
              Container(
                height: 65,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: customTextField(
                    onValidate:(str){
                      return HelperFunctions.checkPassword(str);
                    },
                      controller: controller.passwordController,
                      label: "Password",
                      obsecureText: true,
                      focus: controller.passwordFocusNode,
                      inputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword),
                ),
              ),
              Container(
                height: 65,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: customTextField(
                      controller: controller.confirmPasswordController,
                      onValidate: (str){
                        return HelperFunctions.checkPassword(str);
                      },
                      label: "Confirm Password",
                      obsecureText: true,
                      focus: controller.confirmPasswordFocusNode,
                      inputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 10),
                child: customButton(
                  title: "Sign Up Now!",
                  onTap:(){ controller.signUp();
                  print("Hey");}
                ),
              ),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                    child: Image.asset('assets/images/panda.gif',height: 200)
                  ),
                ],
              )
            ],)


          ),
        ),
      ),
    );
  }
}
