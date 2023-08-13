import 'package:flutter/material.dart';
import 'package:store/consts.dart';

class CustomActionBar extends StatelessWidget {
  final Widget title;
  final int number;
  const CustomActionBar({super.key, required this.title, required this.number});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 60,
        right: 15,
        left: 15,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            Container(
                decoration: BoxDecoration(
                  color: Consts.colorStyleFour,
                  borderRadius: BorderRadius.circular(10)
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$number",
                    style: Consts.textStyleOne
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
