import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';
import 'package:task/core/widgets/custom_button2.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static const String profileId = "Profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(Constants.image8),
            ),
          ),
          Text(
            "Commando 120",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            "abdelaal@gmail.com",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.redAccent,
            ),
          ),
          SizedBox(height: 10),
          CustomButton2(
            text: "Log out",
            colorText: Colors.black,
            colorButton: 0xffF6EAEA,
            ontap: () {},
            fontWight: FontWeight.w700,
            size: 15,
            width: 120,
          ),
        ],
      ),
    );
  }
}
