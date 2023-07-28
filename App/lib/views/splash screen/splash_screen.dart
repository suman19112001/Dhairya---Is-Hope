import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:dhairya/views/main%20screen/screens/main_screen.dart';
import 'package:dhairya/views/onboarding%20screen/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? userUid;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future getUid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userUid = sharedPreferences.getString('uid');
    debugPrint("USER ID FROM SHARED PREFS: $userUid");
  }

  @override
  void initState() {
    super.initState();
    getUid().whenComplete(
      () {
        Timer(
            const Duration(seconds: 3),
            () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => userUid == null
                        ? const OnboardingScreen()
                        : const MainScreen())));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            FadeInUp(
              child: Center(
                child: Container(
                  height: 125,
                  width: 125,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            FadeIn(
              duration: const Duration(seconds: 3),
              child: const Text(
                "Dhairya-is Hope",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            // const Text(
            //   "Choose Life Over Pleasure!",
            //   style: TextStyle(fontSize: 18),
            // ),
            // const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
