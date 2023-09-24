import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  SettingsView({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());

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
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Get.toNamed('/history');
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,10,25,10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              style: BorderStyle.solid,color: Color(0xffC68017)
                          )
                      ),
                      height: 80,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: CircleAvatar(child: Icon(Icons.history),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Order History',style: TextStyle(fontSize: 25,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/terms');
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,10,25,10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              style: BorderStyle.solid,color: Color(0xffC68017)
                          )
                      ),
                      height: 80,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: CircleAvatar(child: Icon(Icons.history),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Terms & Condition',style: TextStyle(fontSize: 25,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed('/privacy');
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25,10,25,10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(
                              style: BorderStyle.solid,color: Color(0xffC68017)
                          )
                      ),
                      height: 80,
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: CircleAvatar(child: Icon(Icons.history),),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Privacy Policy',style: TextStyle(fontSize: 25,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
