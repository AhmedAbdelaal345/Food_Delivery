import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, this.controller});

  NotchBottomBarController? controller;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isList = true;
  List<bool> isheart = [false, false, false];

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      _listTile(
        text: "Burger Combo",
        subtext: "Delicious Burger with Fries",
        image: Constants.image4,
      ),
      _listTile(
        text: "Pizaa",
        subtext: "Freshly backed Pizaa",
        image: Constants.image7,
      ),
      _listTile(
        text: "Chicken wings",
        subtext: "Spicy Chicken Wings",
        image: Constants.image6,
      ),
    ];
    List<Widget> grid = [
      _gridTile(
        text: "Burger Combo",
        subtext: "Delicious Burger with Fries",
        image: Constants.image4,
        price: "12.25",
        icon:
            !isheart[0]
                ? Icon(Icons.favorite_border_outlined, color: Colors.white)
                : Icon(Icons.favorite, color: Colors.red),
        ontap: () {
          setState(() {
            isheart[0] = true;
          });
        },
      ),
      _gridTile(
        text: "Pizaa",
        subtext: "Freshly backed Pizaa",
        image: Constants.image7,
        price: "15.27",
        icon:
            !isheart[1]
                ? Icon(Icons.favorite_border_outlined, color: Colors.white)
                : Icon(Icons.favorite, color: Colors.red),
        ontap: () {
          setState(() {
            isheart[1] = true;
          });
        },
      ),
      _gridTile(
        text: "Chicken Wings",
        subtext: "Spicy chicken Wings",
        image: Constants.image6,
        price: "10.85",
        icon:
            !isheart[2]
                ? Icon(Icons.favorite_border_outlined, color: Colors.white)
                : Icon(Icons.favorite, color: Colors.red),
        ontap: () {
          setState(() {
            isheart[2] = true;
          });
        },
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Delivery",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
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
                    null,
                    Colors.black,
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
                    0xffE72835,
                    Colors.white,
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return list[index];
                    },
                  ),
                )
                : Flexible(
                  child: GridView.builder(
                    itemCount: grid.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return grid[index];
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _gridTile({
    String? price,
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
          onPressed: () {},
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

  Widget _listTile({
    required String text,
    required String subtext,
    required String image,
  }) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(image), radius: 25),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      subtitle: Text(
        subtext,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      trailing: SizedBox(
        width: 90,
        child: _button(
          "Add to cart",
          0xffF6EAEA,
          Colors.black,
          FontWeight.w400,
          14,
          () {},
        ),
      ),
    );
  }

  Widget _button(
    String text,
    int? colorButton,
    Color colorText,
    FontWeight? fontWight,
    double? size,
    VoidCallback ontap,
  ) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 30, // Increased height slightly for better appearance
        padding: EdgeInsets.symmetric(horizontal: 8), // Add padding for text
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.2,
              offset: Offset(2, 2),
              color: Colors.white,
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
              fontWeight: fontWight ?? FontWeight.w600,
              fontSize: size ?? 14,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // Handle text overflow
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
