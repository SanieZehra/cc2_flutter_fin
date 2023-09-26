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
          Text('No Data found!',style: TextStyle(fontSize: 20,
              color: Colors.black87,
              fontFamily: 'MyCustomFont',
              fontWeight: FontWeight.w800),overflow: TextOverflow.visible,),
          Padding(
            padding: const EdgeInsets.only(top: 20,left: 8.0,right: 8.0,),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                    width: 340,
                    child: Image.asset('assets/images/nodata2.gif',)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
