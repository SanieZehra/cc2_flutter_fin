import 'package:cc2_flutter_fin/utils/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/productsModel.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('',style: TextStyle(fontSize: 25,
            color: Colors.black87,
            fontFamily: 'MyCustomFont',
            fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network('${product.image}',height: 400),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(25.0,),
              ),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.all(12.0),
                    child: Text('${product.title}',style: TextStyle(fontSize: 25,
                        color: Colors.black87,
                        fontFamily: 'MyCustomFont',
                        fontWeight: FontWeight.w800),overflow: TextOverflow.visible),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12,right: 12,top: 12),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Product Description',
                            overflow: TextOverflow.visible, // Use TextOverflow.visible for text wrapping
                            style: TextStyle(fontSize: 18,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w800), // You can adjust the font size as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            '${product.description}',
                            overflow: TextOverflow.visible, // Use TextOverflow.visible for text wrapping
                            style: TextStyle(fontSize: 16,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w500), // You can adjust the font size as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Price: \$${product.price}',
                                style: TextStyle(fontSize: 14,
                                color: Colors.black87,
                                fontFamily: 'MyCustomFont',
                                fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          // Add more product details as needed
        ],
      ),
    );
  }
}
