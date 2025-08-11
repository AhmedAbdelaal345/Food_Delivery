import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_button2.dart';
import 'package:task/core/widgets/list_Tile.dart';
import 'package:task/manager/cart_manger.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
  static const String CartId = "Cart";
}

class _CartState extends State<Cart> {
  double deliveryFee = 5.0;
  double taxes = 2.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartManger>(
          builder: (context, cartManager, child) {
            double subtotal = cartManager.totalPrice;
            double total = subtotal + deliveryFee + taxes;
            int totalItems = cartManager.cartItemCount;

            if (cartManager.cartItems.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Your cart is empty",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Cart Items List
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    itemCount: cartManager.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartManager.cartItems[index];
                      
                      return listTile(
                        image: cartItem.image,
                        subText: "Size: Large - \$${cartItem.price.toStringAsFixed(2)} each",
                        text: cartItem.title,
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            cutomButton(
                              text: "-",
                              ontap: () {
                                if (cartItem.quantity > 1) {
                                  cartManager.increaseQuantity(cartItem.id);
                                } else {
                                  // Remove item if quantity would be 0
                                  cartManager.removeFromCartById(cartItem.id);
                                }
                              },
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "${cartItem.quantity}",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            cutomButton(
                              text: "+",
                              ontap: () {
                                cartManager.increaseQuantity(cartItem.id);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                
                // Spacer
                SizedBox(height: 20),
                
                // Price Summary
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "SubTotal ($totalItems items)",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text(
                            "\$${subtotal.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Delivery Fee",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text(
                            "\$${deliveryFee.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Taxes",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                          Spacer(),
                          Text(
                            "\$${taxes.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Divider(thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "\$${total.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomButton2(
                        text: "Checkout (\$${total.toStringAsFixed(2)})",
                        colorText: Colors.white,
                        ontap: () {
                          // Implement checkout logic
                          _showCheckoutDialog(context, cartManager);
                        },
                        colorButton: 0xffE72837,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context, CartManger cartManager) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Checkout'),
          content: Text('Are you sure you want to proceed with the checkout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Confirm'),
              onPressed: () {
                // Clear cart after successful checkout
                cartManager.clearCart();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Order placed successfully!')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}