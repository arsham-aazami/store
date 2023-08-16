import 'package:flutter/material.dart';

import '../consts.dart';

class ImageSwap extends StatefulWidget {
  final List imageList;
  const ImageSwap(
      {super.key, required this.imageList});

  @override
  State<ImageSwap> createState() => _ImageSwapState();
}

class _ImageSwapState extends State<ImageSwap> {
  
  int pageSelected =0 ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          height: 350,
          child: PageView(
            onPageChanged: (number) {
                setState(() => pageSelected = number);
            },
            children: [
              for (var x = 0; x < widget.imageList.length; x++)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      widget.imageList[x],
                      fit: BoxFit.fill,
                    ),
                  ),
                )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < widget.imageList.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                      width: pageSelected == i ? 10 : 15,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Consts.customizedGrayTwo,
                          borderRadius: BorderRadius.circular(15))),
                )
            ],
          ),
        ),
      ],
    );
  }
}
