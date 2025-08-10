import 'package:flutter/material.dart';
import 'package:task/core/widgets/custom_navigation.dart';

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
      home: MyNavigationBar(),
    );
  }
}
