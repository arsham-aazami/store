import 'package:flutter/material.dart';

import '../consts.dart';

class SizeWidget extends StatefulWidget {
  final String size;
  const SizeWidget({super.key, required this.size});
  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => isClicked = true);
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isClicked ? Consts.colorStyleFour : Consts.customizedBlue,
          borderRadius: BorderRadius.circular(10)
        ),
        child:
            Center(child: Text(widget.size, style: Consts.sizeWidgetTextStyle)),
      ),
    );
  }
}
