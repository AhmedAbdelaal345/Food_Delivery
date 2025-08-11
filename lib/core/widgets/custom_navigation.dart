import 'package:flutter/material.dart';
import 'package:task/pages/cart.dart';
import 'package:task/pages/home_page.dart';
import 'package:task/pages/profile.dart';

class CustomNavigation extends StatefulWidget {
  static const String custom = "custom";

  CustomNavigation({super.key});

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  final List<Widget> _body = [HomePage(), const Cart(), const Profile()];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          print("I pressed on the invoked button $index");
          if (index == 1 || index == 2) {
            setState(() {
              index = 0;
            });
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar:
              index == 0
                  ? AppBar(
                    title: Text(
                      "Food Delivery",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          index = 1;
                          setState(() {});
                        },
                        icon: Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  )
                  : index == 1
                  ? AppBar(
                    title: Text(
                      "Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                  )
                  : AppBar(
                    title: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
          body: _body[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            selectedItemColor: Colors.red,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            type: BottomNavigationBarType.shifting,
            onTap: (value) {
              index = value;
              print("The page index is : $index");
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
