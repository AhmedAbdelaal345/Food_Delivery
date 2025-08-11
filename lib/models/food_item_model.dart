import 'package:task/core/constants.dart';
import 'package:task/core/widgets/product_list_widget.dart';

class FoodItemModel {
  final int id = DateTime.now().minute + DateTime.now().second;
  final String image;
 int quantity ;
  final String title;
  final String subtitle;
  final double price;
  bool isAddToCart;
  FoodItemModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.isAddToCart,
    required this.price,
    this.quantity = 1,
  });

  static final List<FoodItemModel> items = [];
}
