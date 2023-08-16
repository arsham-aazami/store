// ignore: file_names
import 'package:flutter/material.dart';
import '../consts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonContainerColor;
  final TextStyle? buttonTextStyle;
  final Color? borderColor;
  final double width;
  final double? height;
  final double? topPadding;
  final double? bottomPadding;
  final double? leftPadding;
  final VoidCallback click;
  final bool loading;
  // final List padding
  const CustomButton(
      {super.key,
      required this.text,
      this.buttonContainerColor = Consts.colorStyleThree,
      this.buttonTextStyle = Consts.textStyleOne,
      this.borderColor,
      required this.width,
      this.height,
      this.topPadding,
      this.bottomPadding = 0,
      this.leftPadding = 0,
      required this.click,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: topPadding ?? 0.0,
          bottom: bottomPadding ?? 0.0,
          left: leftPadding ?? 0.0),
      child: GestureDetector(
        onTap: click,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: buttonContainerColor,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  width: 2, color: borderColor ?? Consts.colorStyleThree)),
          child: Stack(children: [
            Visibility(
              visible: loading ? false : true,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    text,
                    style: buttonTextStyle,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: loading ? true : false,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Center(
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator()),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
