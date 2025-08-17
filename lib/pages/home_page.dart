import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/product_grid_widget.dart';
import 'package:task/core/widgets/product_list_widget.dart';
import 'package:task/models/food_item_model.dart';
// Import your ProductListWidget
// import 'package:task/widgets/product_list_widget.dart'; // Add this import

class HomePage extends StatefulWidget {
  HomePage({super.key, this.controller});

  NotchBottomBarController? controller;
  @override
  State<HomePage> createState() => _HomePageState();
  static const String homeId = "Home";
}

class _HomePageState extends State<HomePage> {
  bool isList = true;
  List<bool> isheart = [false, false, false];
  List<bool> isAddedToCart = [false, false, false];

  @override
  Widget build(BuildContext context) {
    List<FoodItemModel> list = [
      FoodItemModel(
        id: 1,
        image: Constants.image4,
        title: "Burger Combo",
        subtitle: "Delicious Burger with Fries",
        isAddToCart: isAddedToCart[0],
        price: 12.25,
      ),
      FoodItemModel(
        id: 2,
        title: "Pizaa",
        subtitle: "Freshly backed Pizaa",
        image: Constants.image7,
        isAddToCart: isAddedToCart[1],
        price: 25.00,
      ),
      FoodItemModel(
        id: 3,
        title: "Chicken wings",
        subtitle: "Spicy Chicken Wings",
        image: Constants.image6,
        isAddToCart: isAddedToCart[2],
        price: 17.55,
      ),
    ];

    List<FoodItemModel> grid = [
      FoodItemModel(
        id: 1,
        image: Constants.image4,
        title: "Burger Combo",
        subtitle: "Delicious Burger with Fries",
        isAddToCart: isAddedToCart[0],
        price: 12.25,
      ),
      FoodItemModel(
        id: 2,
        title: "Pizaa",
        subtitle: "Freshly backed Pizaa",
        image: Constants.image7,
        isAddToCart: isAddedToCart[1],
        price: 25.00,
      ),FoodItemModel(id: 3,
        title: "Chicken wings",
        subtitle: "Spicy Chicken Wings",
        image: Constants.image6,
        isAddToCart: isAddedToCart[2],
        price: 17.55,)
      // _gridTile(
      //   text: "Burger Combo",
      //   subtext: "Delicious Burger with Fries",
      //   image: Constants.image4,
      //   price: "12.25",
      //   icon:
      //       !isheart[0]
      //           ? Icon(Icons.favorite_border_outlined, color: Colors.white)
      //           : Icon(Icons.favorite, color: Colors.red),
      //   ontap: () {
      //     setState(() {
      //       isheart[0] = !isheart[0];
      //     });
      //   },
      // ),
      // _gridTile(
      //   text: "Pizaa",
      //   subtext: "Freshly backed Pizaa",
      //   image: Constants.image7,
      //   price: "15.27",
      //   icon:
      //       !isheart[1]
      //           ? Icon(Icons.favorite_border_outlined, color: Colors.white)
      //           : Icon(Icons.favorite, color: Colors.red),
      //   ontap: () {
      //     setState(() {
      //       isheart[1] = !isheart[1];
      //     });
      //   },
      // ),
      // _gridTile(
      //   text: "Chicken Wings",
      //   subtext: "Spicy chicken Wings",
      //   image: Constants.image6,
      //   price: "10.85",
      //   icon:
      //       !isheart[2]
      //           ? Icon(Icons.favorite_border_outlined, color: Colors.white)
      //           : Icon(Icons.favorite, color: Colors.red),
      //   ontap: () {
      //     setState(() {
      //       isheart[2] = !isheart[2];
      //     });
      //   },
      // ),
    ];

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorHeight: 18,
            cursorColor: Colors.red.shade200,
            decoration: InputDecoration(
              contentPadding: EdgeInsetsDirectional.symmetric(vertical: 5),
              filled: true,
              fillColor: Color(0xffF3E7E7),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  strokeAlign: 0,
                  color: Colors.red.shade50,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                  strokeAlign: 0,
                  color: Colors.red.shade50,
                ),
              ),
              prefixIcon: Icon(Icons.search, color: Color(0xff8A7174)),
              hintStyle: TextStyle(color: Color(0xff8A7174), fontSize: 14),
              hintText: "Search for food",
            ),
          ),
          _carousalSlider(),
          Text(
            "Featured Items",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _button(
                  "List View",
                  isList ? 0xffE72835 : null,
                  isList ? Colors.white : Colors.black,
                  null,
                  null,
                  () {
                    setState(() {
                      isList = true;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _button(
                  "Grid View",
                  !isList ? 0xffE72835 : null,
                  !isList ? Colors.white : Colors.black,
                  null,
                  null,
                  () {
                    setState(() {
                      isList = false;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          isList
              ? Flexible(
                child: ProductListWidget(items: list), // Using separate widget
              )
              : Flexible(child: ProductGridWidget(items: grid)),
        ],
      ),
    );
  }

  // Button widget for List/Grid toggle
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
        height: 40,
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

  

  Widget _carousalSlider() {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items:
          [
            Constants.image2,
            Constants.image3,
            Constants.image4,
            Constants.image5,
          ].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(i),
                      fit: BoxFit.fill,
                    ),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                );
              },
            );
          }).toList(),
    );
  }
}
