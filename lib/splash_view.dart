import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_7pm/layout/home_layout.dart';

class SplashView extends StatelessWidget {
  static const String routeName = "splash_view";

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
