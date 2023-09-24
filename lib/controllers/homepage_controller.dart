import 'dart:convert';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';
import '../models/productsModel.dart';

class HomePageController extends GetxController{
  final products = <int, Product>{}.obs;
  RxList<CartModel> cartItems = List<CartModel>.empty().obs;
  var isLoading = true.obs;
  Rx<String>data = ''.obs;
  int? count;
  RxInt newCount = 0.obs;
  RxInt cartCount = 0.obs;
  RxInt itemCount = 0.obs;
  RxDouble subtotal=(0.0).obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getProducts();
  }

  Future<void> getProducts() async {
    var response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      jsonData.forEach((json) {
        final product = Product.fromJson(json);
        addProduct(product);
        isLoading.value = false;
        update();
      });
    } else {
      data('Error: ${response.statusCode}');
    }
  }

  void addProduct(Product product) {
    products[product.id] = product;
  }

  Product getProduct(int id) {
    return products[id]!;
  }

  onCartClick(Product item){
    bool itemExists = cartItems.any((cartItem) => cartItem.id == item.id.toString());
    if (itemExists){
      final existingItemIndex = cartItems.indexWhere((cartItem) => cartItem.id == item.id.toString());
      final existingItem = cartItems[existingItemIndex];
      existingItem.quantity++;
      existingItem.total=(existingItem.total!+existingItem.price);
      subtotal.value+=existingItem.total!;
    }
    else{
      cartItems.add(
          CartModel(
            id: item.id.toString(),
            name: item.title.toString(),
            quantity: 1,
            price: item.price,
          ));
    }
  }

  void onRemoveFromCart(CartModel item) {
    cartItems.removeWhere((cartItem) => cartItem.id == item.id);
    cartCount--;
  }

  void onRemoveAllFromCart(CartModel item) {
      var itemToRemove = cartItems.firstWhere((cartItem) => cartItem.id == item.id);
      if (itemToRemove != null) {
        var savedProperty = itemToRemove.quantity;
        cartItems.removeWhere((cartItem) => cartItem.id == item.id);
        cartCount-=savedProperty;
      }
      subtotal.value=subtotal.value-item.total!;
      print(subtotal.value);
  }

  final Map<String, RxInt> itemCountMap = {};

  onContinueonCart(){
    Get.toNamed('/checkoutDetails');
  }

}

class BannerImages {
  static const String banner1 =
      "assets/images/2.gif";
  static const String banner2 =
      "assets/images/1.gif";
  static const String banner3 = "assets/images/3.gif";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
  ];
}