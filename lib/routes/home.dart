import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store/consts.dart';
import 'package:store/routes/mainHome.dart';
import 'package:store/routes/profile.dart';
import 'package:store/routes/saved.dart';
import 'package:store/routes/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 1;
  List<Widget> bottomTap = [const SearchBox(),  MainHome(), const SavedPage(), const Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bottomTap.elementAt(currentIndex),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Consts.customizedGrayOne),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Consts.customizedBlue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: GNav(
                  padding: const EdgeInsets.all(18),
                  rippleColor: Consts.customizedBlue,
                  activeColor: Consts.customizedBlue,
                  tabBackgroundColor: Consts.colorStyleThree,
                  tabBorderRadius: 15,
                  iconSize: 30,
                  tabs: const [
                    GButton(icon: Icons.search),
                    GButton(icon: Icons.home),
                    GButton(icon: Icons.bookmark),
                    GButton(icon: Icons.person),
                  ],
                  selectedIndex: currentIndex,
                  onTabChange: (index) => setState(() => currentIndex = index)),
            ),
          ),
        ));
  }
}
