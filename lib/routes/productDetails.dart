import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/routes/customActionBar.dart';
import 'package:store/routes/mainHome.dart';
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

                  return Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Center(
                      child: ListView(
                          // scrollDirection: Axis.horizontal,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 5, horizontal: 20),
                            //   child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(15),
                            //       child: Image.network(data["images"][0])),
                            // ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              // width: double.infinity,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                              height: 350,
                              child: PageView(
                                children: [
                                  for (var x = 0;
                                      x < productsImages.length;
                                      x++)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(productsImages[x], fit: BoxFit.fill,),
                                      ),
                                    )
                                ],
                              ),
                            ),
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
            Padding(
              padding: const EdgeInsets.only(top: 700),
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