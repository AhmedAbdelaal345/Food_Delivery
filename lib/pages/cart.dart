import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_button2.dart';
import 'package:task/core/widgets/list_Tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // Remove @override from here - it doesn't belong above variables
  int classicBurgerCount = 0;
  int chickenBurgerCount = 0;

  // Prices for each item
  double classicBurgerPrice = 12.99;
  double chickenBurgerPrice = 14.99;

  double deliveryFee = 5.0;
  double taxes = 2.5;

  int get totalItems => classicBurgerCount + chickenBurgerCount;

  double get subtotal =>
      (classicBurgerCount * classicBurgerPrice) +
      (chickenBurgerCount * chickenBurgerPrice);

  double get total => subtotal + deliveryFee + taxes;

  @override // This is the correct place for @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Cart",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            listTile(
              image: Constants.image4,
              subText: "$totalItems items",
              text: "Burger Palace",
              widget: null,
            ),
            listTile(
              text: "Classic Burger",
              subText: '''Size: Large
BurgerPalace - \$${classicBurgerPrice.toStringAsFixed(2)}''',
              image: (Constants.image5),
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cutomButton(
                    text: "-",
                    ontap: () {
                      setState(() {
                        if (classicBurgerCount > 0) {
                          classicBurgerCount--;
                        }
                      });
                    },
                  ),
                  Container(
                    child: Text(
                      " $classicBurgerCount ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  cutomButton(
                    text: "+",
                    ontap: () {
                      setState(() {
                        classicBurgerCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
            listTile(
              text: "Chicken Burger",
              subText: '''Size: Medium
BurgerPalace - \$${chickenBurgerPrice.toStringAsFixed(2)}''',
              image: (Constants.image3),
              widget: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  cutomButton(
                    text: "-",
                    ontap: () {
                      setState(() {
                        if (chickenBurgerCount > 0) {
                          chickenBurgerCount--;
                        }
                      });
                    },
                  ),
                  Container(
                    child: Text(
                      " $chickenBurgerCount ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  cutomButton(
                    text: "+",
                    ontap: () {
                      setState(() {
                        chickenBurgerCount++;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "SubTotal",
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
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ],
            ),

            CustomButton2(
              text: "Checkout",
              colorText: Colors.white,
              ontap: () {},
              colorButton: 0xffE72837,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
