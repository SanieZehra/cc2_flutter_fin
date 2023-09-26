import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/terms_controller.dart';

class TermsAndCondition extends StatelessWidget {
  TermsAndCondition({Key? key}) : super(key: key);
  TermsController controllerTerms = Get.put(TermsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Condition',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Obx(
            () => controllerTerms.isLoading.value
            ? const Center(child:  CircularProgressIndicator())
            : ListView.builder(
            shrinkWrap: true,
              itemCount: controllerTerms.termsData.length,
              itemBuilder: (context, index) {
                final item = controllerTerms.termsData[index];
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item, style: TextStyle(fontSize: 16),textAlign: TextAlign.justify),
          ),
        );
    }),
        ),
    );
  }
}
