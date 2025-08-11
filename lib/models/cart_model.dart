class CartModel {
  final int id;
  final String title;
  final String image;
  final String subtitle;
  final double price;
  int quantity;
  bool isAddToCart;
  CartModel({
    required this.id,
    required this.title,
    required this.image,
    required this.subtitle,
    required this.price,
    this.quantity = 1,
    this.isAddToCart = false,
  });
}
