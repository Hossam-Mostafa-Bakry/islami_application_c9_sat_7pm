import 'package:flutter/material.dart';
import 'package:islami_app_c9_sat_7pm/moduls/hadeth/hadeth_view.dart';
import 'package:islami_app_c9_sat_7pm/moduls/quran/quran_view.dart';
import 'package:islami_app_c9_sat_7pm/moduls/radio/radio_view.dart';
import 'package:islami_app_c9_sat_7pm/moduls/settings/settings_view.dart';
import 'package:islami_app_c9_sat_7pm/moduls/tasbeh/tasbeh_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    QuranView(),
    HadethView(),
    TasbehView(),
    RadioView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background_light.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Islami",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 35,
          ),
          selectedItemColor: Colors.black,
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 28,
          ),
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xFFB7935F),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/hadeth_icon.png")),
              label: "Hadeth",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/sebha_icon.png")),
              label: "Tasbeh",
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/images/radio_icon.png")),
              label: "Radio",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
