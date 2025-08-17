import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants.dart';
import 'package:task/manager/cart_manger.dart';
import 'package:task/models/cart_model.dart';
import 'package:task/models/food_item_model.dart';

class ProductGridWidget extends StatefulWidget {
  final List<FoodItemModel> items;
  ProductGridWidget({super.key, required this.items});

  List<bool> isheart = [false, false, false];
  int index1 = 0;
  @override
  State<ProductGridWidget> createState() => _nameState();
}

class _nameState extends State<ProductGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartManger>(
      builder: (context, CartManger, child) {
        return _gridbuilder();
      },
    );
  }

  Widget _gridbuilder() {
    return GridView.builder(
      itemCount: widget.items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        widget.index1 = index;
        return _gridTile(
          index: index,
          text: widget.items[index].title,
          subtext: widget.items[index].subtitle,
          image: widget.items[index].image,
          icon:
              widget.isheart[index]
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border, color: Colors.red),
          ontap: () {
            setState(() {
              widget.isheart[index] = !widget.isheart[index];
            });
          },
        );
      },
    );
  }

  Widget _gridTile({
    String? price,
    required int index,
    required String text,
    required String subtext,
    required String image,
    required Icon icon,
    required ontap,
  }) {
    return GridTile(
      header: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          "${price ?? 0.00} \$",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        trailing: IconButton(icon: icon, onPressed: ontap),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(
          "$text",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          "$subtext",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart, color: Colors.white),
          onPressed: () {
            // Add to cart logic
            Provider.of<CartManger>(context, listen: false).addToCart(
              CartModel(
                id: widget.items[index].id,
                title: widget.items[index].title,
                image: widget.items[index].image,
                price: widget.items[index].price,
                subtitle: widget.items[index].subtitle,
              ),
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${widget.items[index].title} added to cart!"),
                  backgroundColor: Colors.red.withOpacity(0.8),
                ),
              ),
            );
          },
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            // Handle item tap
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("$image"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
