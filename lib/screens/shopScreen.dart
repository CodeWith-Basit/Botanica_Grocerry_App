import 'package:botanica/screens/SignupScreen.dart';
import 'package:botanica/screens/signInScreen.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
import 'package:botanica/widgets/shopCategory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shopscreen extends StatelessWidget {
  const Shopscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName != null && user!.displayName!.isNotEmpty
        ? user.displayName!
        : (user?.email != null && user!.email!.isNotEmpty
            ? user.email!.split('@')[0]
            : "User");
    final email = user?.email ?? "No email provided";
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppThemes.darkNeutralBg : Colors.white,
      drawer: Drawer(
        backgroundColor: isDark ? const Color(0xFF18181A) : Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                displayName,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
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
                color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
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
                color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
              ),
              title: Text(
                "SignUP",
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
                color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
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
                  backgroundColor: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
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

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: isDark ? AppThemes.darkInputBg : Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? AppThemes.darkCardBorder : Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 1,
                      color: isDark ? AppThemes.darkCardBorder : Colors.grey.shade300,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: isDark ? Colors.grey.shade400 : Colors.grey,
                  ),
                  labelText: "Search Categories....",
                  labelStyle: TextStyle(
                    color: isDark ? AppThemes.darkTextSecondary : Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.mic,
                    color: isDark ? AppThemes.primaryGreen : Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Browse Categories",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    "Refine",
                    style: TextStyle(
                      color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shopcategory(),
            ),
          ],
        ),
      ),
    );
  }
}
