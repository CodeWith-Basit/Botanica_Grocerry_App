import 'package:flutter/material.dart';

class Productdetailscreen extends StatefulWidget {
  final String img;
  final String rating;
  final String title;
  final String weight;
  final String price;
  final String description;

  const Productdetailscreen({
    super.key,
    required this.img,
    required this.rating,
    required this.title,
    required this.weight,
    required this.price,
    required this.description,
  });

  @override
  State<Productdetailscreen> createState() => _ProductdetailscreenState();
}

int quantity = 1;

class _ProductdetailscreenState extends State<Productdetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.share),
          SizedBox(width: 25),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: Color(0xff006E2F),
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.price,
                        style: TextStyle(
                          color: Color(0xff006E2F),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xff735c00)),
                      Icon(Icons.star, color: Color(0xff735c00)),
                      Icon(Icons.star, color: Color(0xff735c00)),
                      Icon(Icons.star, color: Color(0xff735c00)),
                      Icon(
                        Icons.star_border_outlined,
                        color: Color(0xff735c00),
                      ),
                      SizedBox(width: 5),
                      Text(
                        widget.rating,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Description",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      side: BorderSide.none,
                      foregroundColor: Color(0xff006E2F),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.arrow_drop_down),
                    iconAlignment: IconAlignment.end,
                    label: Text("Read More", style: TextStyle(fontSize: 18)),
                  ),

                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.eco, color: Color(0xff006E2F)),
                        label: Text(
                          "100% Organic",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.high_quality_outlined,
                          color: Color(0xff006E2F),
                        ),
                        label: Text(
                          "High Fiber",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Similar Products",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xff006E2F),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => Productdetailscreen(
                                  img: "assets/images/orange.jpg",
                                  rating: "(120 reviews)",
                                  title: "Organic Oranges",
                                  weight: "1kg bag",
                                  price: "\$4.99",
                                  description:
                                      "Oranges are juicy, vitamin-rich citrus fruits celebrated for their refreshing, sweet-tart flavor and vibrant color. Perfect for snacking or juicing, they are packed with immune-boosting vitamin C, dietary fiber, and essential antioxidants, bringing both delicious taste and everyday health benefits to your table",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.08,
                                  ), // Soft premium shadow
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/orange.jpg",
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 10),
                                const Text(
                                  "Organic Oranges",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 4),

                                const Text(
                                  "\$4.99/kg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff006E2F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => Productdetailscreen(
                                  img: "assets/images/watermelon.jpg",
                                  rating: "(120 reviews)",
                                  title: "WaterMelon",
                                  weight: "1 Piece",
                                  price: "\$12.99",
                                  description:
                                      "Quench your thirst with our perfectly ripe, farm-fresh watermelons. Boasting a sweet flavor and crisp, juicy texture, each fruit is carefully selected to deliver a burst of summer freshness. Rich in hydration and essential vitamins, it is the ultimate guilt-free treat for the whole family.",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.08,
                                  ), // Soft premium shadow
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/watermelon.jpg",
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 10),
                                const Text(
                                  "Water Melon",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 4),

                                const Text(
                                  "\$12.99/kg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff006E2F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => Productdetailscreen(
                                  img: "assets/images/pineapple.jpg",
                                  rating: "(190 reviews)",
                                  title: "Pine Apple",
                                  weight: "1 piece",
                                  price: "\$7.99",
                                  description:
                                      "Bring the tropics home with our farm-fresh pineapples. Renowned for their spiky golden-green skin and vibrant, sun-ripened yellow flesh, each bite offers an explosion of sweet and tangy flavor. Perfect for snacking, blending into juices, or adding a gourmet twist to your savory dishes.",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.08,
                                  ), // Soft premium shadow
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/pineapple.jpg",
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 10),
                                const Text(
                                  "Pine Apple",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 4),

                                const Text(
                                  "\$7.99/kg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff006E2F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              (context),
                              MaterialPageRoute(
                                builder: (context) => Productdetailscreen(
                                  img: "assets/images/limes.jpg",
                                  rating: "(50 reviews)",
                                  title: "Seedless Limes",
                                  weight: "50g",
                                  price: "\$2.99",
                                  description:
                                      "Limes are small, vibrant citrus fruits celebrated for their tart, zesty, and highly acidic flavor. Featuring a smooth, bright green rind and juicy, pale green flesh, they are an essential pantry staple for elevating both sweet and savory dishes, as well as crafting refreshing beverages and cocktails.",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 160,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.08,
                                  ), // Soft premium shadow
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    "assets/images/limes.jpg",
                                    height: 110,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                const SizedBox(height: 10),
                                const Text(
                                  "Seedless Limes",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                const SizedBox(height: 4),

                                const Text(
                                  "\$2.99/kg",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff006E2F),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 50,
                      left: 10.0,
                      right: 16.0,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 140,
                          height: 45,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F2F4),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black87,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff006E2F),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.shopping_basket_outlined),
                          label: Text(
                            "Add to Cart",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
