import 'package:botanica/screens/checkoutScreen.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:botanica/widgets/module.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppThemes.darkNeutralBg : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? AppThemes.darkNeutralBg : Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
        ),
        titleSpacing: 0,
        title: Text(
          "Botanica",
          style: GoogleFonts.inter(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications_none,
              color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
            ),
          ),
        ],
      ),
      body: cart.isEmpty
          ? Center(
              child: Text(
                "Add to cart item or no item yet",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppThemes.darkTextSecondary : Colors.black,
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Your Cart",
                      style: GoogleFonts.inter(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppThemes.darkCardSurface
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDark
                                  ? AppThemes.darkCardBorder
                                  : const Color(0xff006E2F),
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                  left: 10,
                                  bottom: 10,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    item.img,
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        item.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "\$${item.price.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: isDark
                                            ? AppThemes.primaryGreen
                                            : const Color(0xff006E2F),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: isDark
                                                ? AppThemes.darkInputBg
                                                : const Color(0xffF1F2F4),
                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove,
                                                  color: isDark
                                                      ? Colors.white70
                                                      : Colors.black,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    if (cart[index].count > 1) {
                                                      cart[index].count -= 1;
                                                    }
                                                  });
                                                },
                                              ),

                                              Text(
                                                "${cart[index].count}",
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: isDark
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),

                                              IconButton(
                                                icon: Icon(
                                                  Icons.add,
                                                  color: isDark
                                                      ? AppThemes.primaryGreen
                                                      : Colors.black,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    cart[index].count += 1;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: AppThemes.tertiaryCoral,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      cart.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(15),
        height: 90,
        decoration: BoxDecoration(
          color: isDark ? AppThemes.darkCardSurface : Colors.white,
          border: Border(
            top: BorderSide(
              color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
            ),
          ),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark
                        ? AppThemes.darkTextSecondary
                        : Colors.black87,
                  ),
                ),
                Text(
                  "\$${getTotalprice().toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppThemes.primaryGreen : Colors.black,
                  ),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: isDark
                    ? AppThemes.primaryGreen
                    : const Color(0xff006E2F),
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 15,
                  bottom: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (cart.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your cart is empty. Add items first.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                ).then((_) => setState(() {}));
              },
              child: const Text(
                "Checkout",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
