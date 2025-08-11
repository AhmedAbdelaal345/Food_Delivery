import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/core/widgets/custom_navigation.dart';
import 'package:task/manager/cart_manger.dart';
import 'package:task/pages/cart.dart';
import 'package:task/pages/home_page.dart';
import 'package:task/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CartManger();
      },

      child: MaterialApp(
        title: 'Food Delivery',
        theme: ThemeData(),
        home: CustomNavigation(),
        initialRoute: "${CustomNavigation.custom}",
        routes: {
          HomePage.homeId: (context) => HomePage(),
          Cart.CartId: (context) => Cart(),
          Profile.profileId: (context) => Profile(),
          CustomNavigation.custom: (context) => CustomNavigation(),
        },
      ),
    );
  }
}
