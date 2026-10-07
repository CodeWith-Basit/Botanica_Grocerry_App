import 'package:botanica/screens/SignupScreen.dart';
import 'package:botanica/screens/signInScreen.dart';
import 'package:botanica/services/auth_service.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
import 'package:botanica/widgets/savedProduct.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Savedscreen extends StatefulWidget {
  const Savedscreen({super.key});

  @override
  State<Savedscreen> createState() => _SavedscreenState();
}

class _SavedscreenState extends State<Savedscreen> {
  Future<void> _addToCart(String title, String img, String price) async {
    final uid = CurrentUser.uid;
    if (uid == null) return;

    final parsedPrice =
        double.tryParse(price.replaceAll(RegExp(r'[^\d.]'), '')) ?? 0.0;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('cart')
        .doc(title)
        .set({'title': title, 'img': img, 'price': parsedPrice, 'count': 1});

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$title added to cart successfully!'),
          backgroundColor: const Color(0xFF53B175),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _removeFromFavorites(String docId) async {
    final uid = CurrentUser.uid;
    if (uid == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('favorite')
        .doc(docId)
        .delete();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$docId removed from favorites.'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    final user = CurrentUser.user;
    final displayName =
        user?.displayName != null && user!.displayName!.isNotEmpty
        ? user.displayName!
        : (user?.email != null && user!.email!.isNotEmpty
              ? user.email!.split('@')[0]
              : "User");
    final email = user?.email ?? "No email provided";
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark
          ? AppThemes.darkNeutralBg
          : const Color(0xFFF9FAFB),
      drawer: Drawer(
        backgroundColor: isDark ? const Color(0xFF18181A) : Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                displayName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              accountEmail: Text(email),
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
              leading: Icon(
                Icons.home_outlined,
                color: isDark
                    ? AppThemes.primaryGreen
                    : const Color(0xff006E2F),
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const Bottomnavigation(initialIndex: 0),
                  ),
                );
              },
            ),

            ListTile(
              leading: Icon(
                Icons.person_outline,
                color: isDark
                    ? AppThemes.primaryGreen
                    : const Color(0xff006E2F),
              ),
              title: Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
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
              leading: Icon(
                Icons.login_outlined,
                color: isDark
                    ? AppThemes.primaryGreen
                    : const Color(0xff006E2F),
              ),
              title: Text(
                "SignUp",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black87,
                ),
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
              leading: Icon(
                Icons.settings_outlined,
                color: isDark
                    ? AppThemes.primaryGreen
                    : const Color(0xff006E2F),
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (!context.mounted) return;
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute<void>(
                      builder: (context) => const Signinscreen(),
                    ),
                    (route) => false,
                  );
                },
                icon: const Icon(Icons.login),
                label: const Text("Logout"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDark
                      ? AppThemes.primaryGreen
                      : const Color(0xff006E2F),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: isDark ? AppThemes.darkNeutralBg : Colors.white,
        elevation: 0,
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

      body: StreamBuilder<QuerySnapshot>(
        stream: CurrentUser.uid != null
            ? FirebaseFirestore.instance
                  .collection('users')
                  .doc(CurrentUser.uid)
                  .collection('favorite')
                  .snapshots()
            : const Stream.empty(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No favorite items yet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
            );
          }
          final docs = snapshot.data!.docs;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Saved Items",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Items you've liked for later",
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
                ),
                // GridView displaying real-time favorite products from Firestore
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // Use docs.length from Firestore instead of the local favorite list
                  itemCount: docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.58,
                  ),
                  itemBuilder: (context, index) {
                    // Extract the product data map for the current document
                    final data = docs[index].data() as Map<String, dynamic>;
                    final String title = data['title'] ?? '';
                    final String img = data['img'] ?? '';
                    final dynamic rawPrice = data['price'];
                    final String priceString = rawPrice != null
                        ? rawPrice.toString()
                        : '0.0';

                    return Savedproduct(
                      img: img,
                      title: title,
                      // Ensure price has a '$' prefix for proper display
                      price: priceString.startsWith('\$')
                          ? priceString
                          : "\$$priceString",
                      weight: '/ pc',
                      tag: index % 2 == 0 ? 'Organic' : 'Seasonal',
                      // Delete using the document ID (docId is the title)
                      onDelete: () => _removeFromFavorites(docs[index].id),
                      // Add to this user's cart in Firestore
                      onAddToCart: () => _addToCart(title, img, priceString),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
