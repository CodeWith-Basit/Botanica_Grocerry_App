import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Bannerslider extends StatelessWidget {
  const Bannerslider({super.key});

  final List<Map<String, dynamic>> bannerImages = const [
    {
      "image": "assets/images/banner_1.png",
      "text": "50% off on\nFresh Fruits",
      "color": Colors.black,
      "buttonText": "Shop Now",
    },
    {
      "image": "assets/images/banner_2.jpg",
      "text": "Garden Fresh\nVegetables",
      "color": Colors.black,
      "buttonText": "Shop Now",
    },
    {
      "image": "assets/images/banner_3.jpg",
      "text": "Half Price on\nProduce—Today",
      "color": Colors.black,
      "buttonText": "Shop Now",
    },
    {
      "image": "assets/images/banner_4.jpg",
      "text": "Fresh Food,\nDelivered",
      "color": Colors.black,
      "buttonText": "Shop Now",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: bannerImages.map((banner) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(banner["image"]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight,
                  colors: [
                    banner["color"].withOpacity(0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    banner["text"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Color(0xff006E2F), // Text
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                      child: Text(banner["buttonText"]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
      options: CarouselOptions(
        autoPlay: true,
        height: 190,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }
}
