import 'package:botanica/screens/checkoutScreen.dart';
import 'package:botanica/services/auth_service.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({super.key});

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  // Helper: Increase item quantity by 1 in Firestore
  Future<void> _incrementCount(String uid, String docId) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(docId)
        .update({'count': FieldValue.increment(1)});
  }

  // Helper: Decrease item quantity by 1 in Firestore (keeps minimum at 1)
  Future<void> _decrementCount(String uid, String docId, int currentCount) async {
    if (currentCount > 1) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(docId)
          .update({'count': FieldValue.increment(-1)});
    }
  }

  // Helper: Remove item document from user's Firestore cart
  Future<void> _deleteItem(String uid, String docId, String title) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(docId)
        .delete();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title removed from cart.'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final uid = CurrentUser.uid;

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

      // 1. StreamBuilder listens to the current user's cart in real-time
      body: StreamBuilder<QuerySnapshot>(
        stream: uid != null
            ? FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('cart')
                .snapshots()
            : const Stream.empty(),
        builder: (context, snapshot) {
          // Loading state while fetching from Firebase
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Empty state if user has no items in cart
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "Your cart is empty",
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppThemes.darkTextSecondary : Colors.black,
                ),
              ),
            );
          }

          final docs = snapshot.data!.docs;

          return SingleChildScrollView(
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
                  // Use real item count from Firestore
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final data = doc.data() as Map<String, dynamic>;
                    final String title = data['title'] ?? '';
                    final String img = data['img'] ?? '';
                    final double price =
                        (data['price'] as num?)?.toDouble() ?? 0.0;
                    final int count = (data['count'] as num?)?.toInt() ?? 1;

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
                                child: img.startsWith('http')
                                    ? Image.network(
                                        img,
                                        width: 75,
                                        height: 75,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.image_not_supported, size: 75),
                                      )
                                    : Image.asset(
                                        img,
                                        width: 75,
                                        height: 75,
                                        fit: BoxFit.cover,
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.image_not_supported, size: 75),
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
                                      title,
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
                                    "\$${price.toStringAsFixed(2)}",
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
                                            // Minus Button
                                            IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: isDark
                                                    ? Colors.white70
                                                    : Colors.black,
                                              ),
                                              onPressed: () => _decrementCount(
                                                uid!,
                                                doc.id,
                                                count,
                                              ),
                                            ),

                                            // Item Quantity Count
                                            Text(
                                              "$count",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: isDark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),

                                            // Plus Button
                                            IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: isDark
                                                    ? AppThemes.primaryGreen
                                                    : Colors.black,
                                              ),
                                              onPressed: () => _incrementCount(
                                                uid!,
                                                doc.id,
                                              ),
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
                            // Delete Button (Trash Icon)
                            Container(
                              height: 100,
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppThemes.tertiaryCoral,
                                ),
                                onPressed: () => _deleteItem(
                                  uid!,
                                  doc.id,
                                  title,
                                ),
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
          );
        },
      ),

      // 2. Bottom bar calculates the total price dynamically from Firestore
      bottomNavigationBar: StreamBuilder<QuerySnapshot>(
        stream: uid != null
            ? FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .collection('cart')
                .snapshots()
            : const Stream.empty(),
        builder: (context, snapshot) {
          // Calculate the live total price
          double totalPrice = 0.0;
          bool hasItems = false;

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            hasItems = true;
            for (var doc in snapshot.data!.docs) {
              final data = doc.data() as Map<String, dynamic>;
              final double price = (data['price'] as num?)?.toDouble() ?? 0.0;
              final int count = (data['count'] as num?)?.toInt() ?? 1;
              totalPrice += price * count;
            }
          }

          return Container(
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
                      "\$${totalPrice.toStringAsFixed(2)}",
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
                    if (!hasItems) {
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
                    );
                  },
                  child: const Text(
                    "Checkout",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
