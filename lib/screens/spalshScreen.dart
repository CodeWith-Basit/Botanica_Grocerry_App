import 'dart:async';
import 'package:botanica/screens/onBoardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute<void>(builder: (context) => Onboardingscreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text(
              "Botanica",
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Color(0xff006E2F),
              ),
            ),
            Text(
              "Artisanal Grocery",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            Spacer(),
            Lottie.asset(
              'assets/splash.json',
              width: 250,
              height: 250,
              fit: BoxFit.contain,
            ),
            Spacer(),
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
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: LinearProgressIndicator(
                color: Color(0xff006E2F),
                backgroundColor: Colors.grey[200],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
