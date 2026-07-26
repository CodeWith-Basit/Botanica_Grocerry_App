import 'package:botanica/screens/SignupScreen.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatefulWidget {
  const Onboardingscreen({super.key});

  @override
  State<Onboardingscreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboardingscreen> {
  int pageNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Spacer(),
              if (pageNumber == 0) ...[
                Image.asset('assets/images/onboard_1.png', height: 250),
                const SizedBox(height: 30),
                const Text(
                  "Fresh Groceries",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Carefully selected organic produce delivered straight from local farms to your kitchen counter.",
                  textAlign: TextAlign.center,
                ),
              ] else if (pageNumber == 1) ...[
                Image.asset('assets/images/onboard_2.jpg', height: 250),
                const SizedBox(height: 30),
                const Text(
                  "Fast & Eco-Delivery",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Sourced with love, packed with care, and delivered to your doorstep in 100% biodegradable packaging.",
                  textAlign: TextAlign.center,
                ),
              ] else ...[
                Image.asset('assets/images/onboard_3.jpg', height: 250),
                const SizedBox(height: 30),
                const Text(
                  "Smart Kitchen, Smart Savings",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Track your grocery budget, enjoy exclusive organic deals, and minimize food waste with Botanica.",
                  textAlign: TextAlign.center,
                ),
              ],
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: pageNumber == 0 ? 24 : 8,
                        decoration: BoxDecoration(
                          color: pageNumber == 0
                              ? Color(0xff006E2F)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 5),
                      // Doosra Dot
                      Container(
                        height: 8,
                        width: pageNumber == 1 ? 24 : 8,
                        decoration: BoxDecoration(
                          color: pageNumber == 1
                              ? Color(0xff006E2F)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 5),
                      // Teesra Dot
                      Container(
                        height: 8,
                        width: pageNumber == 2 ? 24 : 8,
                        decoration: BoxDecoration(
                          color: pageNumber == 2
                              ? Color(0xff006E2F)
                              : Colors.grey,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundBuilder: (context, states, child) {
                    return Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff037633), Color(0xff1db756)],
                        ),
                      ),
                      child: child,
                    );
                  },
                ),
                onPressed: () {
                  setState(() {
                    if (pageNumber < 2) {
                      pageNumber = pageNumber + 1;
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Signupscreen()),
                      );
                    }
                  });
                },
                child: Text(
                  pageNumber == 2 ? "Get Started" : "Next",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    pageNumber = 2;
                  });
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
