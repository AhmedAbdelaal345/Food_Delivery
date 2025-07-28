import 'package:flutter/material.dart';
import 'package:task/core/constants.dart';

class listTile extends StatelessWidget {
  listTile({
    super.key,
    required this.text,
    required this.subText,
    required this.image,
    this.widget,
  });
  String text;
  String subText;
  String image;
  Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          "${text}",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          subText,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        trailing: widget ?? null,
      ),
    );
  }
}
