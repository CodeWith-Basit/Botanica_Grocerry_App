import 'package:flutter/material.dart';

class Productcart extends StatelessWidget {
  final String img;
  final String rating;
  final String title;
  final String weight;
  final String price;
  const Productcart({
    super.key,
    required this.img,
    required this.rating,
    required this.title,
    required this.weight,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 290,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Color(0xffdedfdf),
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              children: [
                Icon(Icons.star, color: Color(0xff735c00)),
                Text(rating, style: TextStyle(fontSize: 12)),
              ],
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18),
            ),
            Text(
              weight,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff006E2F),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff006E2F),
                  radius: 20,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
