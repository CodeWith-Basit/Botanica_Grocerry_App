import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Icon icons;
  final String title;
  final Color containerColor;
  const Category({
    super.key,
    required this.icons,
    required this.containerColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 65,
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: icons,
        ),
        SizedBox(height: 10),
        Text(title, style: TextStyle(color: Colors.grey, fontSize: 16)),
      ],
    );
  }
}
