import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString selectedCategory = 'All'.obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

}

class CategoryList {
  String? categoryId;
  String? categoryName;
  String? prodName;
  String? catImage;
  CategoryList({this.categoryId, this.categoryName, this.prodName, this.catImage});
}
