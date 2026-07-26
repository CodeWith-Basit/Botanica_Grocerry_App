import 'package:botanica/screens/SignupScreen.dart';
import 'package:botanica/screens/signInScreen.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
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
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute<void>(
                    builder: (context) =>
                        const Bottomnavigation(initialIndex: 0),
                  ),
                );
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
                      builder: (context) => Signinscreen(),
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
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
                            backgroundColor: Color(0xff006E2F),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: AssetImage(
                                "assets/images/person.jpg",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Robert Phillep",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Robert@gmail.com",
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6cf8bb),
                            foregroundColor: Color(0xff006E2F),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.verified),
                          label: Text(
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("ACCOUNT ACTIVITIES", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    ListTile(
                      leading: Icon(Icons.history, color: Color(0xff006E2F)),
                      title: Text(
                        "Order History",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text("24 past deliveries"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
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
                        Icons.location_on_outlined,
                        color: Color(0xff006E2F),
                      ),
                      title: Text(
                        "Delivery Addresses",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text("Home, Office, Gym"),

                      trailing: Icon(
                        Icons.arrow_forward_ios,
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
                        Icons.payments_outlined,
                        color: Color(0xff006E2F),
                      ),
                      title: Text(
                        "Payment Methods",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text("Visa ending in •••• 4492"),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text("PREFENCES", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
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
                    ListTile(
                      leading: Icon(
                        Icons.notifications_active,
                        color: Color(0xff735c00),
                      ),
                      title: Text(
                        "Push Notifications",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text("Orders, deals, and restocks"),
                      trailing: Switch(
                        value: isSwitch,
                        activeThumbColor: const Color(0xFFFFFFFF),
                        activeTrackColor: const Color(0xff006E2F),
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (value) {
                          setState(() {
                            isSwitch = value;
                          });
                        },
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
                        Icons.dark_mode,
                        color: const Color.fromARGB(255, 75, 74, 74),
                      ),
                      title: Text(
                        "Dark Appearance",
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      subtitle: Text("Switch theme mode"),

                      trailing: Switch(
                        value: darkMood,
                        activeThumbColor: const Color(0xFFFFFFFF),
                        activeTrackColor: const Color(0xff006E2F),
                        inactiveThumbColor: Colors.grey,
                        inactiveTrackColor: Colors.grey[300],
                        onChanged: (value) {
                          setState(() {
                            darkMood = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xff93000a),
                  backgroundColor: Color(0xffffdad6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                icon: Icon(Icons.login),
                label: Text(
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
