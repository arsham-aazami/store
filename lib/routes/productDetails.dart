import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/routes/customActionBar.dart';
import 'package:store/routes/imageSwape.dart';
import 'package:store/routes/mainHome.dart';
import 'package:store/routes/sizeWidget.dart';
import 'package:store/widgets/customButton.dart';

import '../consts.dart';

class ProductDetails extends StatefulWidget {
  final String productId;

  const ProductDetails({super.key, required this.productId});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  void navigateToHomePage() => print("ars");
  int pageSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Consts.customizedGrayOne,
      body: Container(
        child: Stack(
          children: [
            FutureBuilder(
              future: _products.doc(widget.productId).get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error as String),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else {
                  Map<String, dynamic>? data =
                      snapshot.data!.data() as Map<String, dynamic>;

                  List productsImages = data["images"];
                  List productSizes = data["sizes"];
                  return Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: ListView(children: [
                        ImageSwap(imageList: productsImages),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          child: Text('\$${data["price"]}',
                              style: Consts.headingTextStyleThree),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Text("${data['name']}",
                              style: Consts.textStyleTwo),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Text(
                            "${data['description']}",
                            style: Consts.descriptionTextStyle,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 25),
                          child: Text(
                            "Select Size",
                            style: Consts.textStyleTwo,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Row(
                            children: [
                              for (int j = 0; j < productSizes.length; j++)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizeWidget(
                                      size: productSizes[j].toString()),
                                ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomButton(
                                  text: "Save",
                                  width: 100,
                                  height: 80,
                                  buttonContainerColor: Consts.colorStyleFour,
                                  click: () => print("arsham")),
                              CustomButton(
                                  text: "Add to chart",
                                  width: 220,
                                  height: 80,
                                  borderColor: Consts.customizedBlue,
                                  buttonContainerColor: Consts.customizedBlue,
                                  click: () => print("arsham"))
                            ],
                          ),
                        )
                      ]),
                    ),
                  );
                }
              },
            ),
            CustomActionBar(
                title: GestureDetector(
                  onTap: () => Get.to(() => MainHome()),
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: 40,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Consts.customizedBlue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                        child: Text("Back", style: TextStyle(fontSize: 13))),
                  ),
                ),
                number: 0),
          ],
        ),
      ),
    );
  }
}
// CustomButton(
//                   text: "Product details",
//                   buttonContainerColor: const Color.fromARGB(156, 40, 193, 190),
//                   buttonTextStyle:Consts.textStyleAlertDialog,
//                   width: 34,
//                   height: 45,
//                   borderColor: Consts.customizedGrayOne,
//                   click: navigateToHomePage,
//                 ),