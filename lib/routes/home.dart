import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store/consts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Text("This is Homepage")),
     bottomNavigationBar: Container(
      decoration: const BoxDecoration(
        color: Consts.customizedBlue
      ),
      child: GNav(
        rippleColor: Consts.customizedBlue,
        activeColor: Color.fromARGB(244, 0, 0, 0),
        iconSize: 24,
        tabs: [
          GButton(icon: Icons.home_filled, text: "Home",),
          GButton(icon: Icons.save_as_rounded, text: "Save",),
          GButton(icon: Icons.search_rounded, text: "Search",),
          GButton(icon: Icons.account_circle, text: "Account",),

        ],

        ),
     ),
    );
  }
}