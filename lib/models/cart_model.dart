class CartModel {
  final String id;
  final String name;
  final double price; // Add price field
  int quantity;
  double? total; // Add total field

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  }) {
    this.total = this.price * this.quantity;
  }
}
