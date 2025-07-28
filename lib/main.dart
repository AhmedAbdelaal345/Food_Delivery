import 'dart:developer';
import 'dart:math' show pi;

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Food Delivery',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// widget list
    final List<Widget> bottomBarPages = [
      HomePage(controller: (_controller)),
      const Cart(),
      const Profile(),
    ];
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          bottomBarPages.length,
          (index) => bottomBarPages[index],
        ),
      ),
      extendBody: true,
      bottomNavigationBar:
          (bottomBarPages.length <= maxCount)
              ? AnimatedNotchBottomBar(
                /// Provide NotchBottomBarController
                notchBottomBarController: _controller,
                color: Colors.white,
                showLabel: true,
                textOverflow: TextOverflow.visible,
                maxLine: 1,
                shadowElevation: 5,
                kBottomRadius: 28.0,

                // notchShader: const SweepGradient(
                //   startAngle: 0,
                //   endAngle: pi / 2,
                //   colors: [Colors.white, Colors.grey, Colors.cyanAccent],
                //   tileMode: TileMode.mirror,
                // ).createShader(
                //   Rect.fromCircle(center: Offset.zero, radius: 8.0),
                // ),
                notchColor: Color(0xffF6EAEA),

                /// restart app if you change removeMargins
                removeMargins: false,
                bottomBarWidth: 500,
                showShadow: false,
                durationInMilliSeconds: 300,

                itemLabelStyle: const TextStyle(fontSize: 10),

                elevation: 1,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(Icons.home_filled, color: Colors.grey),
                    activeItem: Icon(Icons.home_filled, color: Colors.red),
                    itemLabelWidget: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.grey,
                    ),
                    activeItem: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.red,
                    ),
                    itemLabelWidget: Text(
                      "Cart",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.grey,
                    ),
                    activeItem: Icon(Icons.person, color: Colors.red),
                    itemLabelWidget: Text(
                      "Profile",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
                onTap: (index) {
                  log('current selected index $index');
                  _pageController.jumpToPage(index);
                },
                kIconSize: 24.0,
              )
              : null,
    );
  }
}
