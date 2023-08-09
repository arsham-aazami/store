import 'package:flutter/material.dart';

class MainHome extends StatelessWidget {
  const MainHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Center(child: Text("Home Page")),
        Text("home Text")
      ]),
    );
  }
}