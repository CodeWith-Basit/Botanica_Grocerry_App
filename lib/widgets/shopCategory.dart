import 'package:botanica/theme/theme_controller.dart';
import 'package:flutter/material.dart';

class Shopcategory extends StatelessWidget {
  const Shopcategory({super.key});
  final List<Map<String, dynamic>> category = const [
    {
      "img": "assets/images/fruits.png",
      "title": "Fruits",
      "bck_color": Color(0xfffff4f4),
      "dark_bck_color": Color(0xFF251A18),
      "text_color": Color(0xff9e5757),
      "dark_text_color": Color(0xFFFF8B7C),
    },
    {
      "img": "assets/images/vegetables.png",
      "title": "Vegetables",
      "bck_color": Color(0xfff0faf0),
      "dark_bck_color": Color(0xFF142419),
      "text_color": Color(0xff006E2F),
      "dark_text_color": Color(0xFF22C55E),
    },
    {
      "img": "assets/images/dairy.png",
      "title": "Dairy",
      "bck_color": Color(0xfff4f9ff),
      "dark_bck_color": Color(0xFF15222E),
      "text_color": Color(0xff526a8e),
      "dark_text_color": Color(0xFF60A5FA),
    },
    {
      "img": "assets/images/bakery.png",
      "title": "Bakery",
      "bck_color": Color(0xfffffbf4),
      "dark_bck_color": Color(0xFF242018),
      "text_color": Color(0xff9e5757),
      "dark_text_color": Color(0xFFFBBF24),
    },
    {
      "img": "assets/images/snacks.png",
      "title": "Snacks",
      "bck_color": Color(0xfffff2b2),
      "dark_bck_color": Color(0xFF252014),
      "text_color": Color(0xffc36f09),
      "dark_text_color": Color(0xFFF59E0B),
    },
    {
      "img": "assets/images/beverages.png",
      "title": "Beverages",
      "bck_color": Color(0xfff4fffe),
      "dark_bck_color": Color(0xFF142422),
      "text_color": Color(0xff3b827a),
      "dark_text_color": Color(0xFF2DD4BF),
    },
    {
      "img": "assets/images/meat.png",
      "title": "Meat",
      "bck_color": Color(0xfff9bfbf),
      "dark_bck_color": Color(0xFF281616),
      "text_color": Color(0xffff0000),
      "dark_text_color": Color(0xFFF87171),
    },
    {
      "img": "assets/images/frozen.png",
      "title": "Frozen",
      "bck_color": Color(0xffcaf0f8),
      "dark_bck_color": Color(0xFF14222C),
      "text_color": Color(0xff0077b6),
      "dark_text_color": Color(0xFF38BDF8),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: category.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final item = category[index];
        final bgColor = isDark
            ? (item["dark_bck_color"] as Color)
            : (item["bck_color"] as Color);
        final textColor = isDark
            ? (item["dark_text_color"] as Color)
            : (item["text_color"] as Color);
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgColor,
            border: Border.all(
              color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage(item["img"]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                item["title"],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
