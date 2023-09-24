import '../controllers/categories_controller.dart';

class CategoriesData{
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
}

class CategoryList{
  String?categoryId;
  String?categoryName;
  String?prodName;
  String?catImage;
  CategoryList({this.categoryId,this.categoryName,this.prodName,this.catImage});
}