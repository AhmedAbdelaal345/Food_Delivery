import 'package:flutter/material.dart';

class CustomButton2 extends StatelessWidget {
  CustomButton2({
    super.key,
    required this.text,
    this.colorButton,
    required this.colorText,
    this.fontWight,
    this.size,
    required this.ontap,
    this.width,
  });
  String text;
  int? colorButton;
  Color colorText;
  FontWeight? fontWight;
  double? size;
  VoidCallback ontap;
  double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 40,
        width:width?? double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              spreadRadius: 0.2,
              offset: Offset(2, 2),
              color: Colors.white,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Color(colorButton ?? 0xffF3E7E7),
        ),
        child: Center(
          child: Text(
            "$text",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorText,
              fontWeight: fontWight ?? FontWeight.w600,
              fontSize: size ?? 14,
            ),
          ),
        ),
      ),
    );
  }
}
