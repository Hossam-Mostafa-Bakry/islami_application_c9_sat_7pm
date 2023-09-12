import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_7pm/layout/home_layout.dart';
import 'package:islami_app_c9_sat_7pm/splash_view.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        HomeLayout.routeName: (context) => HomeLayout(),
      },
    );
  }
}
