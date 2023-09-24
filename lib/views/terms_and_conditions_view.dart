import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checking Out',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Coming SOON!',style: TextStyle(fontSize: 20,
              color: Colors.black87,
              fontFamily: 'MyCustomFont',
              fontWeight: FontWeight.w400),overflow: TextOverflow.visible,)
        ],
      ),
    );
  }
}
