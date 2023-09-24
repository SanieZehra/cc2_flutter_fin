import 'package:flutter/material.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Data found!',style: TextStyle(fontSize: 14,
              color: Colors.black87,
              fontFamily: 'MyCustomFont',
              fontWeight: FontWeight.w400),overflow: TextOverflow.visible,)
        ],
      ),
    );
  }
}
