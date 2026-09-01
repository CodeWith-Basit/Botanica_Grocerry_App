import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Explorescreen extends StatelessWidget {
  const Explorescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Color(0xff006E2F)),
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
            child: Icon(Icons.notifications_none, color: Color(0xff006E2F)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                style: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF191E1A)
                      : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF273029)
                          : Colors.grey.shade300,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF273029)
                          : Colors.grey.shade300,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade400
                        : Colors.grey,
                  ),
                  labelText: "Search fresh groceries....",
                  labelStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey.shade500
                        : Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.close,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF22C55E)
                        : const Color(0xff006E2F),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF22C55E)
                            : const Color(0xff006E2F),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.tune),
                      label: const Text("Filters", style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF191E1A)
                            : Colors.white,
                        foregroundColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade300
                            : Colors.grey,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.tune),
                      label: const Text(
                        "Price: Under \$10",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 15),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF191E1A)
                            : Colors.white,
                        foregroundColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade300
                            : Colors.grey,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.tune),
                      label: const Text(
                        "Rating: 4.5+",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "Search Suggestions",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 210,
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF191E1A)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black26
                          : Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.trending_up,
                        color: Color(0xff006E2F),
                      ),
                      title: Text(
                        "Organic Curly Kale Salad",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.arrow_outward_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.shopping_cart,
                        color: Color(0xff006E2F),
                      ),
                      title: Text(
                        "Fresh Kale Bunches",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.arrow_outward_outlined,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.restaurant_outlined,
                        color: Color(0xff006E2F),
                      ),
                      title: Text(
                        "Smoothie Mix with Kale",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.arrow_outward_outlined,
                        color: Colors.grey,
                      ),
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
                    "Recent Searches",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Clear All",
                    style: TextStyle(color: Color(0xff006E2F), fontSize: 18),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 232, 232),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.replay, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Avocado Toast Kit",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Spacer(),
                    Icon(Icons.close, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 232, 232),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.replay, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Dragonfruit Organic",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Spacer(),
                    Icon(Icons.close, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 60,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 232, 232),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.replay, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(
                      "Kombucha Classic",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Spacer(),
                    Icon(Icons.close, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Trending Now",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 15),
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff006E2F).withValues(alpha: 0.15),
                        blurRadius: 15,
                        spreadRadius: 1,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage("assets/images/trend.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  width: 350,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xff006E2F).withValues(alpha: 0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 18,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seasonal Peak",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Winter Greens",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Container(
                    height: 160,
                    width: 165,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xffd3fdea),
                          child: Icon(Icons.eco, color: Color(0xff006E2F)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Micro-Greens",
                          style: TextStyle(
                            color: Color(0xff3d4a3d),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "\$4.50",
                          style: TextStyle(
                            color: Color(0xff006E2F),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    height: 160,
                    width: 165,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xfffff6da),
                          child: Icon(
                            Icons.energy_savings_leaf,
                            color: Color(0xff735c00),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Superfoods",
                          style: TextStyle(
                            color: Color(0xff3d4a3d),
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "New In",
                          style: TextStyle(
                            color: Color(0xff006E2F),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "People are buying",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffe6e8ea),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),

                    onPressed: () {},
                    child: Text("Wheatgrass"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffe6e8ea),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("🥑 Haas Avocado"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffe6e8ea),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),

                    onPressed: () {},
                    child: Text("Wild Berries"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffe6e8ea),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("🍄 Shiitake"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffe6e8ea),
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                onPressed: () {},
                child: Text("🥛 Oat Milk"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
