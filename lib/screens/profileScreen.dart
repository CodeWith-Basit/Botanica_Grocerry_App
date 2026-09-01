import 'package:botanica/screens/SignupScreen.dart';
import 'package:botanica/screens/signInScreen.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({super.key});

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  bool isSwitch = false;
  bool darkMood = false;

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
              },
            ),

            ListTile(
              leading: Icon(
                Icons.login_outlined,
                color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
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
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => Signinscreen(),
                    ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: isDark ? AppThemes.darkCardSurface : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                            child: const CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                "assets/images/person.jpg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          email,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? AppThemes.darkTextSecondary : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark ? const Color(0xFF1B2A20) : const Color(0xff6cf8bb),
                            foregroundColor: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                          ),
                          onPressed: () {},
                          icon: const Icon(Icons.verified),
                          label: const Text(
                            "Premium Member",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "ACCOUNT ACTIVITIES",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppThemes.darkTextSecondary : Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: isDark ? AppThemes.darkCardSurface : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.history, color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F)),
                      title: Text(
                        "Order History",
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "24 past deliveries",
                        style: TextStyle(color: isDark ? AppThemes.darkTextSecondary : Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      color: isDark ? AppThemes.darkCardBorder : Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_on_outlined,
                        color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                      ),
                      title: Text(
                        "Delivery Addresses",
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Home, Office, Gym",
                        style: TextStyle(color: isDark ? AppThemes.darkTextSecondary : Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                    Divider(
                      color: isDark ? AppThemes.darkCardBorder : Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.payments_outlined,
                        color: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                      ),
                      title: Text(
                        "Payment Methods",
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Visa ending in •••• 4492",
                        style: TextStyle(color: isDark ? AppThemes.darkTextSecondary : Colors.grey),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "PREFERENCES",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppThemes.darkTextSecondary : Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: isDark ? AppThemes.darkCardSurface : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.notifications_active,
                        color: isDark ? AppThemes.secondaryGreen : const Color(0xff735c00),
                      ),
                      title: Text(
                        "Push Notifications",
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Orders, deals, and restocks",
                        style: TextStyle(color: isDark ? AppThemes.darkTextSecondary : Colors.grey),
                      ),
                      trailing: Switch(
                        value: isSwitch,
                        activeThumbColor: const Color(0xFFFFFFFF),
                        activeTrackColor: isDark ? AppThemes.primaryGreen : const Color(0xff006E2F),
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: isDark ? AppThemes.darkCardBorder : Colors.grey[300],
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                          });
                        },
                      ),
                    ),
                    Divider(
                      color: isDark ? AppThemes.darkCardBorder : Colors.grey,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dark_mode,
                        color: ThemeController.isDarkMode
                            ? AppThemes.primaryGreen
                            : const Color.fromARGB(255, 75, 74, 74),
                      ),
                      title: Text(
                        "Dark Appearance",
                        style: TextStyle(
                          fontSize: 18,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        "Switch theme mode",
                        style: TextStyle(color: isDark ? AppThemes.darkTextSecondary : Colors.grey),
                      ),
                      trailing: Switch(
                        value: ThemeController.isDarkMode,
                        activeThumbColor: const Color(0xFFFFFFFF),
                        activeTrackColor: AppThemes.primaryGreen,
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: isDark ? AppThemes.darkCardBorder : Colors.grey[300],
                        onChanged: (value) {
                          setState(() {
                            ThemeController.toggleTheme(value);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: isDark ? const Color(0xFFFF8B7C) : const Color(0xff93000a),
                  backgroundColor: isDark ? const Color(0xFF281616) : const Color(0xffffdad6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                icon: const Icon(Icons.login),
                label: const Text(
                  "Log Out of Account",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    letterSpacing: 0.6,
                  ),
                  children: [
                    TextSpan(text: "Version 2.4.1  •  Created by "),
                    TextSpan(
                      text: "CodeWithBasit",
                      style: TextStyle(
                        color: Color(0xff006E2F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
