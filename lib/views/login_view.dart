
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/login_controller.dart';
import '../utils/helper_functions.dart';
import '../widgets/widgets.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final controller=Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.loginKey,
              child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 35.0, bottom: 10.0),
                        child: Image.asset('assets/images/blackLogo.png',height: 200),
                      ),
                      Container(
                        height: 55,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          child: customTextField(controller: controller.emailController,
                              label: "Email",
                              onValidate: (str){
                                return HelperFunctions.checkEmail(str);
                              },
                              focus: controller.emailFocusNode,
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress),
                        ),
                      ),
                      Container(
                        height: 55,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          child: customTextField(
                              controller: controller.passwordController,
                              label: "Password",
                              obsecureText: true,
                              onValidate: (str){
                                return HelperFunctions.checkPassword(str);
                              },
                              focus: controller.passwordFocusNode,
                              inputAction: TextInputAction.next,
                              textInputType: TextInputType.visiblePassword),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: (){
                                controller.onForgotPassword();
                                }, child: Text('Forgot Password?',style: TextStyle(fontSize: 16),)),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                        child: customButton(
                            title: "Login",
                            onTap:(){ controller.login();
                            }
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: customButton(
                            title: "Sign In With Google",
                            onTap:(){
                              controller.signInWithGoogle();
                            }
                        ),
                      ),
                      Row(
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                              child: Image.asset('assets/images/login.gif')),
                        ],
                      ),
                    ],)
              ),
            ),
          ),
        )
    );
}}
