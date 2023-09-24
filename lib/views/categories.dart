
import 'package:flutter/material.dart';

import '../controllers/categories_controller.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedCategory="All";
  List<CategoryList>categoryList=[
    CategoryList(categoryId: '1',categoryName: 'His',prodName:'Diary',catImage:'assets/images/diary.png'),
    CategoryList(categoryId: '1',categoryName: 'His',prodName:'Wallet',catImage:'assets/images/wallet.png'),
    CategoryList(categoryId: '1',categoryName: 'His',prodName:'Perfume',catImage:'assets/images/perfume.png'),
    CategoryList(categoryId: '2',categoryName: 'Her',prodName:'Handbag',catImage:'assets/images/handbag.png'),
    CategoryList(categoryId: '2',categoryName: 'Her',prodName:'Teddy',catImage:'assets/images/teddy.png'),
    CategoryList(categoryId: '2',categoryName: 'Her',prodName:'Mugs',catImage:'assets/images/mugs.png'),
    CategoryList(categoryId: '3',categoryName: 'Other',prodName:'Frame',catImage:'assets/images/frame.png'),
    CategoryList(categoryId: '3',categoryName: 'Other',prodName:'Surprise',catImage:'assets/images/surprise.png'),
    CategoryList(categoryId: '3',categoryName: 'Other',prodName:'Donuts',catImage:'assets/images/donuts.png'),
  ];

  List<CategoryList> getFilteredItems() {
    if (selectedCategory == "All") {
      return categoryList; // Return all items
    } else {
      return categoryList.where((item) => item.categoryId == selectedCategory).toList();
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: (){
                      setState(() {
                        selectedCategory='2';
                      });
                    },
                    child: Text('Her',style: TextStyle(
                        color: Colors.black
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(// Background color
                    ),
                    onPressed: (){
                      setState(() {
                        selectedCategory='1';
                      });
                    },
                    child: Text('His',style: TextStyle(
                        color: Colors.black
                    ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    ),
                    onPressed: (){
                      setState(() {
                        selectedCategory='3';
                      });
                    },
                    child: Text('Other',style: TextStyle(
                        color: Colors.black
                    ),),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: getFilteredItems().length,
                itemBuilder: (context, int index) {
                  final itemLen=getFilteredItems()[index];
                  return Container(
                    height: 140,
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                      color: Color(0xffffffff),
                      child: Center(
                        child: ListTile(
                          title: Text(
                              '${itemLen.prodName}',
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16,fontFamily: 'MyCustomFont'),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2// Change text color
                          ),
                          subtitle: Text(
                              'Price: ${itemLen.categoryId}',
                              style: TextStyle(color: Colors.black,fontSize: 14,fontFamily: 'MyCustomFont',fontWeight: FontWeight.w500) // Change text color
                          ),
                          leading: Container(
                            width: 70,
                            height: 100,
                            child: Image.asset('${itemLen.catImage}'),
                          ),
                            // Replace with your desired icon
                            // You can also customize the icon, e.g., Icon(Icons.edit),
                          ),
                        ),
                      ),
                  );
                },
              ),

          ),
        ],
      ),
    );
  }
}
class CategoryList{
  String?categoryId;
  String?categoryName;
  String?prodName;
  String?catImage;
  CategoryList({this.categoryId,this.categoryName,this.prodName,this.catImage});
}