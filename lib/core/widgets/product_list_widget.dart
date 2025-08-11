import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/manager/cart_manger.dart';
import 'package:task/models/cart_model.dart';
import 'package:task/models/food_item_model.dart';

class ProductListWidget extends StatefulWidget {
  final List<FoodItemModel> items;

  ProductListWidget({super.key, required this.items});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildListProduct();
  }

  Widget _listTile({required FoodItemModel item}) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(item.image),
          radius: 25,
        ),
        title: Text(
          item.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          item.subtitle,
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        trailing: SizedBox(
          width: MediaQuery.of(context).size.width / 2.8,
          child: _button(
            item.isAddToCart ? "Remove from cart" : "Add to cart",
            item.isAddToCart ? 0xffE72835 : 0xffF6EAEA,
            item.isAddToCart ? Colors.white : Colors.black,
            FontWeight.w600,
            10,
            () {
              setState(() {
                item.isAddToCart = !item.isAddToCart;
              });
              Provider.of<CartManger>(context, listen: false).addToCart(
                CartModel(
                  id: item.id,
                  title: item.title,
                  image: item.image,
                  subtitle: item.subtitle,
                  price: item.price,
                  quantity: item.quantity,
                  isAddToCart: item.isAddToCart,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _button(
    String text,
    int? colorButton,
    Color colorText,
    FontWeight? fontWeight,
    double? size,
    VoidCallback ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 35,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.2,
              offset: Offset(2, 2),
              color: Colors.grey.withOpacity(0.3),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
          color: Color(colorButton ?? 0xffF3E7E7),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: colorText,
              fontWeight: fontWeight ?? FontWeight.w600,
              fontSize: size ?? 14,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildListProduct() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        return _listTile(item: item);
      },
    );
  }
}
