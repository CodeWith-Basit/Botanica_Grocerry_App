import 'dart:async';
import 'package:botanica/screens/onBoardingscreen.dart';
import 'package:botanica/widgets/bottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 7), _navigateNext);
  }

  void _navigateNext() {
    if (!mounted) return;
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (context) => const Bottomnavigation(initialIndex: 0),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(
          builder: (context) => const Onboardingscreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              "Botanica",
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: const Color(0xff006E2F),
              ),
            ),
            const Text(
              "Artisanal Grocery",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            const Spacer(),
            Lottie.asset(
              'assets/splash.json',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            Center(
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    letterSpacing: 0.6,
                  ),
                  children: [
                    TextSpan(text: "Created by "),
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
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                color: const Color(0xff006E2F),
                backgroundColor: Colors.grey[200],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
