import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';

class cutomButton extends StatelessWidget {
  cutomButton({super.key, required this.text, this.ontap});
  String text;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Constants.color,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          // This ensures perfect centering
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
