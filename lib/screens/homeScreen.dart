import 'package:botanica/screens/SignupScreen.dart';
import 'package:botanica/screens/productDetailscreen.dart';
import 'package:botanica/screens/savedScreen.dart';
import 'package:botanica/screens/signInScreen.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
import 'package:botanica/widgets/module.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:botanica/widgets/bannerSlider.dart';
import 'package:botanica/widgets/category.dart';
import 'package:botanica/widgets/discountCart.dart';
import 'package:botanica/widgets/productCart.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void _addToCart(String title, String img, double price) {
    final alreadyExists = cart.any((item) => item.title == title);
    if (alreadyExists) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title is already in your cart.'),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        cart.add(Module(title: title, img: img, price: price, count: 1));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title added to cart successfully!'),
          backgroundColor: const Color(0xFF53B175),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Robert Phillep",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: const Text("Robert@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/person.jpg'),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xff006E2F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color(0xff006E2F),
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.person_outline,
                color: Color(0xff006E2F),
              ),
              title: const Text(
                "My Profile",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const Bottomnavigation(initialIndex: 4),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.login_outlined,
                color: Color(0xff006E2F),
              ),
              title: const Text(
                "SignUp",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const Signupscreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings_outlined,
                color: Color(0xff006E2F),
              ),
              title: const Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) =>  Signinscreen(),
                    ),
                  );
                },
                icon: Icon(Icons.login),
                label: Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff006E2F),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          "Botanica",
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Color(0xff006E2F),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: Icon(Icons.favorite_outlined, color: Colors.red),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Savedscreen()),
                );
              },
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(width: 1, color: Colors.grey),
                  ),
                  prefixIcon: Icon(Icons.search),
                  labelText: "Search fresh groceries....",
                  suffixIcon: Icon(Icons.tune, color: Color(0xff006E2F)),
                ),
              ),
            ),
            SizedBox(height: 30),
            Bannerslider(),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "View All",
                    style: TextStyle(color: Color(0xff006E2F), fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Category(
                      icons: Icon(
                        Icons.restaurant_outlined,
                        color: Color(0xff006e2f),
                      ),
                      containerColor: Color(0xffe1f4eb),
                      title: "Veggies",
                    ),
                    SizedBox(width: 15),
                    Category(
                      icons: Icon(Icons.apple, color: Color(0xff735c00)),
                      containerColor: Color(0xfff3f1e1),
                      title: "Fruits",
                    ),
                    SizedBox(width: 15),
                    Category(
                      icons: Icon(
                        Icons.water_drop_outlined,
                        color: Color(0xff006e2f),
                      ),
                      containerColor: Color(0xffe1f4eb),
                      title: "Dairy",
                    ),
                    SizedBox(width: 15),
                    Category(
                      icons: Icon(
                        Icons.breakfast_dining,
                        color: Color(0xff6d7b6c),
                      ),
                      containerColor: Color(0xfff1f5f4),
                      title: "Bakery",
                    ),
                    SizedBox(width: 15),
                    Category(
                      icons: Icon(Icons.wine_bar, color: Color(0xff006e2f)),
                      containerColor: Color(0xffe1f4eb),
                      title: "Drinks",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Special Discounts",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(Icons.arrow_forward, color: Color(0xff006E2F)),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Discountcart(
                        img: "assets/images/grapes.jpg",
                        discount: "-15%",
                        title: "Fresh &\nCreamy",
                        subtitle: "Grapes",
                        oldPrice: "\$5.00",
                        price: "\$4.50",
                      ),
                    ),
                    SizedBox(width: 15),
                    Discountcart(
                      img: "assets/images/orange.jpg",
                      discount: "-15%",
                      title: "Fresh &\nCreamy",
                      subtitle: "Orange",
                      oldPrice: "\$5.00",
                      price: "\$4.50",
                    ),
                    SizedBox(width: 15),
                    Discountcart(
                      img: "assets/images/avacado.jpg",
                      discount: "-15%",
                      title: "Fresh &\nCreamy",
                      subtitle: "Avacado",
                      oldPrice: "\$5.00",
                      price: "\$4.50",
                    ),
                    SizedBox(width: 15),
                    Discountcart(
                      img: "assets/images/stawberry.jpg",
                      discount: "-15%",
                      title: "Fresh &\nCreamy",
                      subtitle: "Stawberry",
                      oldPrice: "\$5.00",
                      price: "\$4.50",
                    ),
                    SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Popular Products",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "See All",
                    style: TextStyle(color: Color(0xff006E2F), fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdetailscreen(
                              img: "assets/images/egg.jpg",
                              rating: "(120 reviews)",
                              title: "Egg",
                              weight: "12 Pack",
                              price: "\$7.99",
                              description:
                                  "Treat your family to farm-fresh, pasture-raised eggs. Our hens roam freely on lush, pesticide-free pastures, foraging for a natural diet that results in rich, golden yolks and unmatched flavor.",
                            ),
                          ),
                        );
                      },
                      child: Productcart(
                        img: "assets/images/egg.jpg",
                        rating: "4.7",
                        title: "Egg",
                        weight: "12 pack",
                        price: "\$7.99",
                        onAddToCart: () =>
                            _addToCart("Egg", "assets/images/egg.jpg", 7.99),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => Productdetailscreen(
                              img: "assets/images/apple.jpg",
                              rating: "(420 reviews)",
                              title: "Fresh Apples",
                              weight: "1kg Bag",
                              price: "\$5.99",
                              description:
                                  "Bring home farm-fresh, hand-picked apples, packed with natural sweetness, satisfying crunch, and rich antioxidants. Whether you are making fresh juice, baking, or looking for a healthy, low-calorie on-the-go snack, these premium-quality apples are the perfect choice for your daily diet.",
                            ),
                          ),
                        );
                      },
                      child: Productcart(
                        img: "assets/images/apple.jpg",
                        rating: "3.4",
                        title: "Fresh Apples",
                        weight: "1kg Bag",
                        price: "\$5.99",
                        onAddToCart: () => _addToCart(
                          "Fresh Apples",
                          "assets/images/apple.jpg",
                          5.99,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => Productdetailscreen(
                              img: "assets/images/milk.jpg",
                              rating: "(250 reviews)",
                              title: "Organic Milk",
                              weight: "1 Liter",
                              price: "\$2.99",
                              description:
                                  "Experience the pure, farm-fresh taste of our premium daily milk. Sourced directly from local, ethically-raised dairy cows, our milk is gently pasteurized to preserve essential nutrients while ensuring maximum safety. Creamy, rich, and naturally delicious, it is the perfect wholesome addition to your morning coffee, cereal, or baking recipes.",
                            ),
                          ),
                        );
                      },
                      child: Productcart(
                        img: "assets/images/milk.jpg",
                        rating: "5",
                        title: "Organic Milk",
                        weight: "1 Liter",
                        price: "\$2.99",
                        onAddToCart: () => _addToCart(
                          "Organic Milk",
                          "assets/images/milk.jpg",
                          2.99,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          (context),
                          MaterialPageRoute(
                            builder: (context) => Productdetailscreen(
                              img: "assets/images/borocli.jpg",
                              rating: "(60 reviews)",
                              title: "Fresh Broccoli",
                              weight: "500g",
                              price: "\$1.99",
                              description:
                                  "Fresh, crisp, and nutrient-packed, our premium broccoli crowns are harvested at peak ripeness for maximum flavor and crunch. This vibrant green, all-natural superfood is perfect for healthy steaming, roasting, or tossing into stir-fries. Elevate your daily meals with a delicious and wholesome dietary staple.",
                            ),
                          ),
                        );
                      },
                      child: Productcart(
                        img: "assets/images/borocli.jpg",
                        rating: "5",
                        title: "Fresh Broccoli",
                        weight: "500g",
                        price: "\$1.99",
                        onAddToCart: () => _addToCart(
                          "Fresh Broccoli",
                          "assets/images/borocli.jpg",
                          1.99,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
