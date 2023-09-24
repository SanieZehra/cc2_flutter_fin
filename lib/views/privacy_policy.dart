import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Coming SOON!',style: TextStyle(fontSize: 14,
              color: Colors.black87,
              fontFamily: 'MyCustomFont',
              fontWeight: FontWeight.w400),overflow: TextOverflow.visible,)
        ],
      ),
    );
  }
}
