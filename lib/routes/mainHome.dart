import 'package:flutter/material.dart';
import 'package:store/consts.dart';
import 'package:store/routes/customActionBar.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Consts.customizedGrayOne),
      height: double.infinity,
      child: const Stack(children: [
        CustomActionBar(number: 0, title: "Home",),
        Text("home Text")
      ]),
    );
  }
}