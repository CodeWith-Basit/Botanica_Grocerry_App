import 'package:flutter/material.dart';

class Shopcategory extends StatelessWidget {
  const Shopcategory({super.key});
  final List<Map<String, dynamic>> category = const [
    {
      "img": "assets/images/fruits.jpg",
      "title": "Fruits",
      "bck_color": Color(0xfffff4f4),
      "text_color": Color(0xff9e5757),
    },
    {
      "img": "assets/images/vegetable.jpg",
      "title": "Vegetables",
      "bck_color": Color(0xfff0faf0),
      "text_color": Color(0xff006E2F),
    },
    {
      "img": "assets/images/dairy.jpg",
      "title": "Dairy",
      "bck_color": Color(0xfff4f9ff),
      "text_color": Color(0xff526a8e),
    },
    {
      "img": "assets/images/bakery.jpg",
      "title": "Bakery",
      "bck_color": Color(0xfffffbf4),
      "text_color": Color(0xff9e5757),
    },
    {
      "img": "assets/images/snaks.jpg",
      "title": "Snaks",
      "bck_color": Color(0xfffff2b2),
      "text_color": Color(0xffc36f09),
    },
    {
      "img": "assets/images/beverages.jpg",
      "title": "Beverages",
      "bck_color": Color(0xfff4fffe),
      "text_color": Color(0xff3b827a),
    },
    {
      "img": "assets/images/meat.jpg",
      "title": "Meat",
      "bck_color": Color(0xfff9bfbf),
      "text_color": Color(0xffff0000),
    },
    {
      "img": "assets/images/frozen.jpg",
      "title": "Frozen",
      "bck_color": Color(0xffcaf0f8),
      "text_color": Color(0xff0077b6),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: category.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = category[index];
        return Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: item["bck_color"] as Color,
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(item["img"]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                item["title"],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: item["text_color"] as Color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
